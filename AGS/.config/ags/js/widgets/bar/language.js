const hyprland = await Service.import("hyprland")

export default () => Widget.Label({
  label: "Colemak",
  setup: (self) => {
    hyprland.connect("keyboard-layout", (_hyprland, _keyboard, layout) => {
      if (layout === "English (Colemak)") self.label = "Colemak"
      else if (layout === "English (US)") self.label = "US"
      else if (layout === "Arabic") self.label = "Arabic"
    })
  }
})
