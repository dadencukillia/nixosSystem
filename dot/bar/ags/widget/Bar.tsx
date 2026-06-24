import app from "ags/gtk4/app";
import { Astal, Gtk, Gdk } from "ags/gtk4";
import { DecorativeCircles } from "./DecorativeCircles";
import { Time } from "./Time";
import { CalendarPopup, updateCalendars } from "./CalendarPopup";
import Workspaces from "./Workspaces";
import { Tray } from "./Tray";
import { Bluetooth } from "./Bluetooth";
import { Wifi } from "./Wifi";
import { Battery } from "./Battery";
import { OutputAudio } from "./OutputAudio";
import { InputAudio } from "./InputAudio";
import { Language } from "./Language";
import { Player } from "./Player";
import { AppTitles } from "./AppTitles";
import { createState } from "gnim";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;
  const [ middleWidget, setMiddleWidget ] = createState("title");

  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={ gdkmonitor }
      exclusivity={ Astal.Exclusivity.EXCLUSIVE }
      marginTop={ 8 }
      marginLeft={ 8 }
      marginBottom={ 0 }
      marginRight={ 8 }
      anchor={ TOP | LEFT | RIGHT }
      application={ app }
    >
      <centerbox
        orientation={ Gtk.Orientation.HORIZONTAL }
        valign={ Gtk.Align.CENTER }
      >

        <box
          $type="start"
          orientation={ Gtk.Orientation.HORIZONTAL }
          spacing={ 25 }
          marginEnd={ 10 }
        >
          <DecorativeCircles />
          <Workspaces />
        </box>

        <box
          $type="center"
        >
          <stack
            visibleChildName={ middleWidget }
            transitionType={ Gtk.StackTransitionType.OVER_UP }
            halign={ Gtk.Align.CENTER }
          >
            <box halign={ Gtk.Align.CENTER } $type="named" name="title"><AppTitles /></box>
            <box halign={ Gtk.Align.CENTER }$type="named" name="player"><Player  onAudioUpdate={ (p) => setMiddleWidget( p ? "player" : "title" ) } /></box>
          </stack>
        </box>

        <box
          $type="end"
          orientation={ Gtk.Orientation.HORIZONTAL }
          spacing={ 10 }
        >
          <Tray marginRight={ 10 } />
          <box
            spacing={ 5 }
            orientation={ Gtk.Orientation.HORIZONTAL }
            marginStart={ 10 }
          >
            <Language />
            <OutputAudio />
            <InputAudio />
            <Battery />
            <Wifi />
            <Bluetooth />
          </box>
          <MenuTime />
        </box>

      </centerbox>
    </window>
  )
}

function MenuTime() {
  return (<menubutton
    class="invisible"
    cursor={ new Gdk.Cursor({
      name: "pointer"
    }) }
  >
    <Time />
    <popover onShow={ updateCalendars }><CalendarPopup /></popover>
  </menubutton>);
}
