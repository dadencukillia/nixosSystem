import { Gtk } from "ags/gtk4";
import Hyprland from "gi://AstalHyprland"
import { createBinding, createComputed, For } from 'gnim';

interface Workspace {
  id: number,
  focused: boolean,
  number: number,
  icon: string
}

export default function Workspaces() {
  const hyprland = Hyprland.get_default();
  const focusedWorkspace = createBinding(hyprland, "focusedWorkspace");
  const applications = createBinding(hyprland, "clients");

  const icons: Record<string, string> = {
    "zen": "󰖟",
    "thunar": "",
    "kitty": "",
    "foot": "",
    "steam": "󰓓",
    "": ""
  };

  const workspacesMap = createComputed(() => {
    const focusedWorkspaceValue = focusedWorkspace();

    const workspaces = Array.from({ length: 10 }, (_, index): Workspace => {
      return {
        id: index + 1,
        number: index === 9 ? 0 : index + 1,
        focused: focusedWorkspaceValue.id === index + 1,
        icon: ""
      };
    });

    for (const app of applications()) {
      if (app.workspace.id > 10 || app.workspace.id < 1) continue;

      const workspaceItem = workspaces[app.workspace.id - 1];
      if (workspaceItem.icon !== "") continue;

      const appIconKey = Object.keys(icons)
        .find(v => v === app.initialClass);

      if (appIconKey) {
        workspaceItem.icon = icons[appIconKey];
      } else {
        workspaceItem.icon = icons[""];
      }
    }

    return workspaces;
  });

  return (
    <box
      class="workspaces"
      orientation={ Gtk.Orientation.HORIZONTAL }
      spacing={ 15 }
    >
    <For each={ workspacesMap }>
    { workspace => (
      <label label={ workspace.icon === "" ? String(workspace.number) : workspace.icon } class={ workspace.focused ? "yellow" : "white" } />
    ) }
    </For>
    </box>
  );
}
