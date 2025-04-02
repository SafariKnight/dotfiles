import { App } from "astal/gtk3";
import style from "./styles/style.scss";
import Bar from "./widget/Bar/Bar";
import Power from "./widget/Power/Power";

App.start({
  icons: "./icons",
  css: style,
  main() {
    App.get_monitors().map(Bar);
    Power();
  },
  instanceName: "desktop-shell",
});
