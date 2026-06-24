import { Gtk } from "ags/gtk4";
import AstalTray from "gi://AstalTray?version=0.1";
import { createBinding, For } from "gnim";

export function Tray({ marginRight = 0 }: { marginRight?: number }) {
  const tray = AstalTray.get_default();
  const items = createBinding(tray, "items");

  const trayEl = (
    <box
      orientation={ Gtk.Orientation.HORIZONTAL }
      spacing={ 5 }
      valign={ Gtk.Align.CENTER }
      vexpand={ false }
      visible={ items.as(itms => itms.length !== 0) }
      marginEnd={ marginRight }
    >
    <For each={ items }>
    { (item: AstalTray.TrayItem) => {
      return (
      <button class="invisible">
        <image
          iconName={ item.iconName }
          iconSize={ Gtk.IconSize.NORMAL }
          pixelSize={ 16 }
        />

        <Gtk.GestureClick button={1}
          onPressed={ (_ev, _n, x, y) => item.activate(x, y) }
        />
        <Gtk.GestureClick button={2}
          onPressed={ (_ev, _n, x, y) => item.secondary_activate(x, y) }
        />
        <Gtk.GestureClick button={3}
          onPressed={ () => {
            const popup = Gtk.PopoverMenu.new_from_model(item.menuModel);
            popup.set_parent(trayEl as Gtk.Widget);
            popup.set_has_arrow(false);
            popup.set_offset(0, 15);

            popup.insert_action_group("dbusmenu", item.actionGroup);
            item.connect("notify::action-group", (tray_item) => {
              popup.insert_action_group("dbusmenu", tray_item.actionGroup);
            })

            item.about_to_show();
            popup.show();
            popup.popup();
          } }
        />
      </button>
    )} }
    </For>
    </box>
  );

  return trayEl;
}
