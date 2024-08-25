const hyprland = await Service.import("hyprland");

export default () =>
  Widget.Label({
    className: "window__title",
    name: "window-title",
    label: hyprland.active.client.bind("title"),
    setup: (self) => {
      self.toggleClassName("window__empty", self.label === "");
      self.hook(hyprland, (self) => {
        self.toggleClassName("window__empty", self.label === "");
      });
    },
  });
