import { bind } from "astal";
import Hyprland from "gi://AstalHyprland";

const hyprland = Hyprland.get_default();

const dispatch = (id: number) => hyprland.dispatch("workspace", `${id}`);

export default function Workspaces() {
  const hypr = Hyprland.get_default();

  return (
    <box className="Workspaces">
      {[1, 2, 3, 4, 5].map((ws) => (
        <button
          className={bind(hypr, "focusedWorkspace").as((fw) =>
            ws === fw.id ? "focused" : "",
          )}
          onClicked={() => dispatch(ws)}
        >
          {ws}
        </button>
      ))}
    </box>
  );
}
