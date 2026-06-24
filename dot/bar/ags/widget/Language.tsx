import { Gtk } from "ags/gtk4";
import { createPoll } from "ags/time"
import { Accessor } from "gnim";

export function Language() {
  const jsonData = createPoll("{}", 1_000, "hyprctl devices -j");
  const layout: Accessor<string> = jsonData(devices => {
    const dict = JSON.parse(devices);
    return dict
      .keyboards?.find(v => v.main)?.active_keymap
      ?? "";
  });

  return (
    <button
      widthRequest={ 30 }
      class="status-badge"
    >
      <stack
        visibleChildName={ layout.as(v => v.toLowerCase().split(" ")[0]) }
        transitionType={ Gtk.StackTransitionType.SLIDE_RIGHT }
        css="font-size: 12px;"
      >
        <label $type="named" name="ukrainian" label="UA" />
        <label $type="named" name="english" label="EN" />
      </stack>
    </button>
  );
}
