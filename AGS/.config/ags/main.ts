import date from "./ts/widgets/bar/date";
import ws from "./ts/widgets/bar/workspaces";
import title from "./ts/widgets/bar/title";
import language from "./ts/widgets/bar/language"
const Bar = (monitor: number = 0) =>
  Widget.Window({
    name: `bar${monitor}`,
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
        className: "center",
      }),
      endWidget: Widget.Box({
        children: [
          Widget.Box({
            children: [
              language()
            ],
            className: "right",
          }),
        ],
        hpack: "end",
      }),
    }),
  });
const loadCss = () => {
  const mainScss = `${App.configDir}/scss/style.scss`;

  const tempCss = `/tmp/ags/style.css`;

  Utils.exec(`sass ${mainScss} ${tempCss}`);
  App.resetCss();
  App.applyCss(tempCss);
};

Utils.monitorFile(`${App.configDir}/scss`, loadCss);
loadCss()

App.config({
  windows: [Bar()],
});
