import { Gdk } from "ags/gtk4";
import AstalBluetooth from "gi://AstalBluetooth?version=0.1";
import { createBinding } from "gnim";

export function Bluetooth() {
  const bluetooth = AstalBluetooth.get_default();
  const isPowered = createBinding(bluetooth, "isPowered");
  const isConnected = createBinding(bluetooth, "isConnected");
  const connectedName = isConnected(() => {
    const devices = bluetooth.devices;
    const connectedName = devices.find(dev => dev.connected);
    return connectedName?.name ?? "No device";
  })

  return (
    <button
      cursor={ Gdk.Cursor.new_from_name("pointer", null) }
      class={ isPowered.as(v => v ? "status-badge active" : "status-badge") }
      onClicked={ () => { bluetooth.toggle() } }
      tooltipText={ connectedName }
      vexpand={ false }
      hexpand={ false }
      widthRequest={ 30 }
      heightRequest={ 16 }
    >
      <label label={ isConnected.as(v => v ? "󰂱" : "󰂯") } />
    </button>
  )
}
