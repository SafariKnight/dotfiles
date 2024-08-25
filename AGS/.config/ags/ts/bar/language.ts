import { icons } from "lib/icons";

const hyprland = await Service.import("hyprland");

const layouts = [
  /* Layout Name, Display Name */
  ["English (Colemak)", "Colemak"],
  ["English (US)", "US"],
  ["Arabic", "Arabic"],
];

export default () =>
  Widget.CenterBox({
    className: "language__box",
    startWidget: Widget.Icon({
      icon: icons.system.language,
      className: "language__icon",
    }),
    centerWidget: Widget.Label({
      label: "Colemak", // It's the label cause it's my default
      className: "language__label",
      setup: (self) => {
        hyprland.connect(
          "keyboard-layout",
          (_hyprland, _keyboard: string, layout: string) => {
            self.label = (layouts.find((lo) => lo[0] === layout) ?? [
              "",
              "Unknown",
            ])[1];
          },
        );
      },
    }),
  });
