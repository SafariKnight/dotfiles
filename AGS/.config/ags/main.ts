import Bar from "ts/bar/bar";
import AudioFlyout from "ts/quicksettings/audio"
App.addIcons(`${App.configDir}/assets`)

const monitor = 0

const loadCss = () => {
  const mainScss = `${App.configDir}/scss/style.scss`;

  const tempCss = `/tmp/ags/style.css`;

  Utils.exec(`sass ${mainScss} ${tempCss}`);
  App.resetCss();
  App.applyCss(tempCss);
};


Utils.monitorFile(`${App.configDir}/scss`, loadCss);
loadCss();

App.config({
  windows: [
    Bar(monitor),
    AudioFlyout(monitor),
  ],
});
