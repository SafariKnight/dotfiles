import date from "./date";
import ws from "./workspaces";
import title from "./title";
import language from "./language"
import audio from "./audio"

export default (monitor = 0) =>
  Widget.Window({
    name: `bar`,
    monitor: monitor,
    anchor: ["top", "left", "right"],
    margins: [3, 3, 0, 3],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      startWidget: Widget.Box({
        children: [
          Widget.Box({
            children: [date(), ws()],
            className: "left",
          }),
        ],
      }),
      centerWidget: Widget.Box({
        children: [title()],
        hpack: "center",
        hexpand: true,
        className: "center",
      }),
      endWidget: Widget.Box({
        children: [
          Widget.Box({
            children: [
              audio(),
              language(),
            ],
            className: "right",
          }),
        ],
        hpack: "end",
      }),
    }),
  });
