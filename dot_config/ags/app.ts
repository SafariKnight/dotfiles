import { App } from "astal/gtk3";
import { monitorFile } from "astal/file";
import { exec } from "astal/process";
import Bar from "./widget/Bar/Bar";
import Power from "./widget/Power/Power";

function updateStyles() {
  exec("sass ./styles/style.scss /tmp/ags.css");
}

updateStyles();
App.start({
  icons: "./icons",
  css: "/tmp/ags.css",
  main() {
    //create windows for already connected monitors
    App.get_monitors().map(Bar);
    //create windows for newly connected monitors
    App.connect("monitor_added", (_, mon) => Bar(mon));
    //remove windows for removed monitors
    App.connect("monitor_removed", (_, mon) => {
      App.get_windows().forEach((w) => {
        if (w.gdkmonitor == mon) App.remove_window(w);
      });
    });
    Power();
  },
  instanceName: "desktop-shell",
});

monitorFile("./styles/_matugen.scss", () => {
  App.reset_css();
  updateStyles();
  App.apply_css("/tmp/ags.css");
});
