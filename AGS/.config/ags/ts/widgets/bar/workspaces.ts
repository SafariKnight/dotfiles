const hyprland = await Service.import("hyprland");

const dispatch = (ws: string | number) =>
  hyprland.messageAsync(`dispatch workspace ${ws}`);

export default () =>
  Widget.Box({
    className: "ws__box",
    children: Array.from({ length: 10 }, (_, i) => i + 1).map((i) =>
      Widget.Button({
        attribute: i,
        className: "ws__btn",
        vpack: "center",
        label: `${i}`,
        on_clicked: () => dispatch(i),
        setup: (self) => {
          self.hook(hyprland, () => {
            self.toggleClassName(
              "ws__btn--active",
              hyprland.active.workspace.id === i,
            );
            self.toggleClassName(
              "ws__btn--occupied",
              (hyprland.getWorkspace(i)?.windows || 0) > 0,
            );
          });
        },
      }),
    ),
    setup: self => self.hook(hyprland, () => self.children.forEach(btn => {
        btn.visible = hyprland.workspaces.some(ws => ws.id === btn.attribute);
    })),
  });
