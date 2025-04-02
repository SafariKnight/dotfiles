import { App, Astal, Gdk } from "astal/gtk3";
import Time from "./Time";
import Workspaces from "./Workspaces";
import AppName from "./AppName";
import PowerButton from "./Power";
import Gtk from "gi://Gtk?version=3.0";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      className="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={App}
      namespace="bar"
    >
      <centerbox>
        <box halign={Gtk.Align.START}>
          <PowerButton />
          <Workspaces />
        </box>
        <box halign={Gtk.Align.CENTER}>
          <AppName />
        </box>
        <box halign={Gtk.Align.END}>
          <Time />
        </box>
      </centerbox>
    </window>
  );
}
