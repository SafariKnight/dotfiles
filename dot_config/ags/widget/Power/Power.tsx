import { exec } from "astal";
import Popover from "../Popover";
import Gtk from "gi://Gtk?version=3.0";

const buttons = {
  shutdown: {
    tooltip: "Power Off",
    icon: "shutdown",
    function: () => {
      exec("systemctl poweroff");
    },
  },
  restart: {
    tooltip: "Restart",
    icon: "reboot",
    function: () => {
      exec("systemctl reboot");
    },
  },
  sleep: {
    tooltip: "Sleep",
    icon: "suspend",
    function: () => {
      exec("systemctl suspend");
    },
  },
  hibernate: {
    tooltip: "Hibernate",
    icon: "suspend-hibernate",
    function: () => {
      exec("systemctl hibernate");
    },
  },
  logout: {
    tooltip: "Log Out",
    icon: "log-out",
    function: () => {
      exec("hyprctl dispatch exit");
    },
  },
};

export default function Power() {
  return Popover({
    halign: Gtk.Align.START,
    valign: Gtk.Align.START,
    name: "PowerFlyout",
    namespace: "power-flyout",
    visible: false,
    marginTop: 35,
    marginLeft: 5,
    child: (
      <box className="PowerFlyout" spacing={3} vertical>
        {Object.entries(buttons).map(
          ([, { tooltip, icon, function: func }]) => {
            return (
              <eventbox tooltipText={tooltip} expand onClick={() => func()}>
                <icon icon={icon} />
              </eventbox>
            );
          },
        )}
      </box>
    ),
  });
}
