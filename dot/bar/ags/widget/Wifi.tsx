import { Gdk } from "ags/gtk4";
import AstalNetwork from "gi://AstalNetwork?version=0.1";
import { createBinding } from "gnim";

export function Wifi({ marginRight = 0 }: { marginRight?: number }) {
  const network = AstalNetwork.get_default();
  const wifi = network.get_wifi();
  if (!wifi) return (<></>);

  const enabled = createBinding(wifi, "enabled");
  const activeConnection = createBinding(wifi, "active_connection");
  const ssid = createBinding(wifi, "ssid");

  return (
    <button
      cursor={ Gdk.Cursor.new_from_name("pointer", null) }
      class={ enabled.as(v => v ? "status-badge active" : "status-badge") }
      onClicked={ () => wifi.set_enabled(!enabled()) }
      tooltipText={ ssid }
      vexpand={ false }
      hexpand={ false }
      widthRequest={ 30 }
      heightRequest={ 16 }
      marginEnd={ marginRight }
    >
      <label class="icon-offset" label={ activeConnection.as(v => v ? "󰤨" : "󰤭") } />
    </button>
  )
}
