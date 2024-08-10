const hyprland = await Service.import("hyprland")

export default () => Widget.Label({
  label: "Colemak",
  className: "language__label",
  setup: (self) => {
    hyprland.connect("keyboard-layout", (hyprland, _keyboard: string, layout: string) => {
      if (layout === "English (Colemak)") self.label = "Colemak"
      else if (layout === "English (US)") self.label = "US"
      else if (layout === "Arabic") self.label = "Arabic"
    })
  }
})
