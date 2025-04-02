import { App } from "astal/gtk3";

export default function PowerButton() {
  return (
    <button
      className="PowerButton"
      onClicked={() => {
        App.get_window("PowerFlyout")!.show();
      }}
    >
      <icon icon="os-fedora" />
    </button>
  );
}
