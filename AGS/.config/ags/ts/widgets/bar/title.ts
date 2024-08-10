const hyprland = await Service.import("hyprland");

export default () =>
  Widget.Label({
    className: "window__title",
    name: "window-title",
    setup: (self) => {
      self.label = hyprland.active.client.title;
    },
  }).hook(hyprland, (self) => {
    self.label = hyprland.active.client.title;
  });

// export default function() {
//   return LabelkV
//   // return Widget.Label({
//   //   label: Label().bind,
//   //   name: "window-title",
//   //   className: "window__title"
//   // })
// }
