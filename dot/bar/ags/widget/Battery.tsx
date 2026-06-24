import { Gtk } from "ags/gtk4";
import { createPoll } from "ags/time";

export function Battery() {
  const capacity = createPoll("0", 10_000, "cat /sys/class/power_supply/BAT0/capacity").as(v => Number(v));
  const isCharging = createPoll("Discharging", 10_000, "cat /sys/class/power_supply/BAT0/status").as(v => v === "Charging");
  const progressbarWidth = capacity.as(v => v / 2);

  const overlayLayer = (<overlay>
    <box
      halign={ Gtk.Align.FILL }
      valign={ Gtk.Align.FILL }
      orientation={ Gtk.Orientation.HORIZONTAL }
    >
      <box widthRequest={ progressbarWidth } class="progressbar orange-bar" />
      <box widthRequest={ progressbarWidth.as(v => 50 - v) } />
    </box>
  </overlay>) as Gtk.Overlay;

  overlayLayer.add_overlay(<label
    label={ isCharging.as(v => v ? "󱐋" : "") }
  /> as Gtk.Widget);

  return (
    <button
      overflow={ Gtk.Overflow.HIDDEN }
      class="status-badge outlined"
      css="color: var(--fg);"
      widthRequest={ 50 }
      heightRequest={ 16 }
      tooltipText={ capacity.as(v => v + "%") }
    >
    { overlayLayer }
    </button>
  )
}
