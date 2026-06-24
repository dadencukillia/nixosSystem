import AstalHyprland from "gi://AstalHyprland?version=0.1";
import Pango from "gi://Pango?version=1.0";
import { createBinding, With } from "gnim";

export function AppTitles() {
  const hyprland = AstalHyprland.get_default();
  const focusedClient = createBinding(hyprland, "focusedClient");

  return (
    <With value={ focusedClient }>
    { client => client && (
      <label
        hexpand={ false }
        maxWidthChars={ 50 }
        ellipsize={ Pango.EllipsizeMode.END }
        label={ createBinding(client, "title").as(t => t ?? "") }
      />
    ) }
    </With>
  );
}
