import { Gtk } from "ags/gtk4";

export function DecorativeCircles() {
  return (
    <box
      orientation={ Gtk.Orientation.HORIZONTAL }
      spacing={ 5 }
      valign={ Gtk.Align.CENTER }
      vexpand={ false }
      class="decorationButtons"
    >
      <box class="red" widthRequest={ 8 } heightRequest={ 8 } />
      <box class="orange" widthRequest={ 8 } heightRequest={ 8 } />
      <box class="green" widthRequest={ 8 } heightRequest={ 8 } />
    </box>
  );
}
