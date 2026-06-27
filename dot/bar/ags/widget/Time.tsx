import { Gtk } from "ags/gtk4";
import { createPoll } from "ags/time";

export function Time() {
  const time = createPoll("", 2_000, "date \"+%H:%M\"")
  const date = createPoll("", 60_000, "date \"+%b %d\"")

  return (
    <box
      orientation={ Gtk.Orientation.HORIZONTAL }
      spacing={ 5 }
      vexpand={ false }
      hexpand={ false }
      valign={ Gtk.Align.CENTER }
    >
      <label label={ date } />
      <label label={ time } class="bold" />
    </box>
  );
}
