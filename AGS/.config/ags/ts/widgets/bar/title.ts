const hyprland = await Service.import("hyprland");

export default () =>
  Widget.Label({
    className: "window__title",
    name: "window-title",
    setup: (self) => {
      self.label = hyprland.active.client.title;
      self.toggleClassName("window__empty", self.label === "");
      self.hook(hyprland, (self) => {
        self.label = hyprland.active.client.title;
        self.toggleClassName("window__empty", self.label === "");
      });
    },
  });
