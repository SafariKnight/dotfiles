import PanelButton from "ts/PanelButton";
import { icons } from "lib/icons";

const audio = await Service.import("audio");

export default () =>
  PanelButton({
    className: "audio__btn",
    window: "audio-flyout",
    child: Widget.Icon().hook(audio.speaker, (self) => {
      if (audio.speaker.is_muted) {
        self.icon = icons.audio.volume.muted;
        return;
      }
      const vol = Math.floor(audio.speaker.volume * 100);

      const icon: string = [
        [67, "high"],
        [34, "medium"],
        [1, "low"],
        [0, "muted"],
      ].find(([threshold]) => threshold <= vol)?.[1];
      self.icon = icons.audio.volume[icon];
    }),
    on_middle_click: () => {
      audio.speaker.is_muted = !audio.speaker.is_muted
    },
    on_clicked: () => {
      App.toggleWindow("audio-flyout");
    },
    setup: (self) => { },
  });
