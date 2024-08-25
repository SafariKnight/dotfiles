import PopupWindow from "ts/PopupWindow";
import { icons, icon } from "lib/icons";
// import GLib from "gi://GLib?version=2.0";

const audio = await Service.import("audio");
type AudioType = "speaker" | "microphone";

const VolumeIndicator = (type: AudioType = "speaker") =>
  Widget.Button({
    on_clicked: () => (audio[type].is_muted = !audio[type].is_muted),
    className: "audio__icon",
    child: Widget.Icon().hook(audio[type], (self) => {
      const kind = type === "speaker" ? "volume" : "mic";
      if (audio[type].is_muted) {
        self.icon = icons.audio[kind].muted;
        return;
      }
      const vol = Math.floor(audio[type].volume * 100);

      const icon: string = [
        [67, "high"],
        [34, "medium"],
        [1, "low"],
        [0, "muted"],
      ].find(([threshold]) => threshold <= vol)?.[1];
      self.icon = icons.audio[kind][icon];
    }),
  });

const VolumeSlider = (type: AudioType = "speaker") =>
  Widget.Slider({
    className: "audio__slider",
    hexpand: true,
    drawValue: false,
    on_change: ({ value, dragging }) => {
      if (dragging) {
        audio[type].volume = value;
        audio[type].is_muted = false;
      }
    },
    value: audio[type].bind("volume"),
  });

const Volume = (type: AudioType = "speaker") =>
  Widget.Box({
    className: "volume__box",
    children: [VolumeIndicator(type), VolumeSlider(type)],
  });

export default (monitor = 0) =>
  PopupWindow({
    name: "audio-flyout",
    monitor: monitor,
    layout: "top-right",
    exclusivity: "normal",
    transition: "slide_down",
    child: Widget.Box({
      vertical: true,
      vpack: "center",
      className: "audio",
      children: [Volume("speaker"), Volume("microphone")],
    }),
  });
