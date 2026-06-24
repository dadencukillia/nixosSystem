import { Gdk, Gtk } from "ags/gtk4";
import AstalWp from "gi://AstalWp?version=0.1";
import GLib from "gi://GLib?version=2.0";
import { createBinding, createComputed, createState } from "gnim";

let audioTimer: number | null = null;

export function InputAudio() {
  const wp = AstalWp.get_default();
  const currentMicrophone = wp.defaultMicrophone;
  const iconName = createBinding(currentMicrophone, "volumeIcon");
  const deviceName = createBinding(currentMicrophone, "description");
  const mute = createBinding(currentMicrophone, "mute");
  const volume = createBinding(currentMicrophone, "volume");

  const tooltipText = createComputed(() => `${ deviceName() }: ${ Math.round(volume() * 100) }%`);

  const [ content, setContent ] = createState("icon");

  const scrollController = Gtk.EventControllerScroll.new(Gtk.EventControllerScrollFlags.VERTICAL);
  scrollController.connect("scroll", (_s, _dx, dy) => {
    if (Math.abs(dy) > 0.0005) setContent("percent");

    currentMicrophone.set_volume(volume() - dy / 25);

    // Debounce

    if (audioTimer !== null) {
      GLib.source_remove(audioTimer);
      audioTimer = null;
    }

    audioTimer = GLib.timeout_add(GLib.PRIORITY_DEFAULT, 1500, () => {
      setContent("icon");
      audioTimer = null;
      return GLib.SOURCE_REMOVE;
    });
  });
  scrollController.connect("scroll-end", () => {
    setContent("icon");
    if (audioTimer !== null) {
      GLib.source_remove(audioTimer);
      audioTimer = null;
    }
  });

  return (
    <button
      class={ mute.as(p => p ? "status-badge" : "status-badge active") }
      tooltipText={ tooltipText }
      widthRequest={ 24 }
      cursor={ Gdk.Cursor.new_from_name("pointer", null) }
      onClicked={ () => {
        currentMicrophone.set_mute(!mute());
      } }
    >
      <stack
        visibleChildName={ content }
        transitionType={ Gtk.StackTransitionType.SLIDE_UP }
      >
        <label 
          $type="named" name="percent" 
          label={ volume.as(p => Math.round(p * 100) + "%") } 
          css="font-size: 10px;"
        />

        <image $type="named" name="icon" iconName={ iconName } />
      </stack>
      { scrollController }
    </button>
  );
}

