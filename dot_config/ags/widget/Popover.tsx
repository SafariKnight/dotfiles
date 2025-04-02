import { Astal, Gdk, Gtk, Widget, App } from "astal/gtk3";

const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor;

type PopoverProps = Pick<
  Widget.WindowProps,
  | "name"
  | "namespace"
  | "className"
  | "visible"
  | "child"
  | "marginBottom"
  | "marginTop"
  | "marginLeft"
  | "marginRight"
  | "halign"
  | "valign"
> & {
  onClose?(self: Widget.Window): void;
};

export default function Popover({
  child,
  marginBottom,
  marginTop,
  marginLeft,
  marginRight,
  halign = Gtk.Align.CENTER,
  valign = Gtk.Align.CENTER,
  onClose,
  ...props
}: PopoverProps) {
  return (
    <window
      {...props}
      css="background-color: transparent"
      keymode={Astal.Keymode.EXCLUSIVE}
      anchor={TOP | BOTTOM | LEFT | RIGHT}
      exclusivity={Astal.Exclusivity.IGNORE}
      onNotifyVisible={(self) => {
        if (!self.visible) onClose?.(self);
      }}
      application={App}
      // close when click occurs otside of child
      onButtonReleaseEvent={(self, event) => {
        const [, _x, _y] = event.get_root_coords();
        const { x, y, width, height } = self.get_child()!.get_allocation();

        const xOut = _x < x || _x > x + width;
        const yOut = _y < y || _y > y + height;

        // clicked outside
        if (xOut || yOut) {
          self.visible = false;
        }
      }}
      // close when hitting any key that's not a modifier
      onKeyPressEvent={(self, event: Gdk.Event) => {
        // Includes 65027 because apparently Gdk.KEY_ALT_R isn't altgr
        const ignored = [
          Gdk.KEY_Control_L,
          Gdk.KEY_Control_R,
          Gdk.KEY_Alt_L,
          Gdk.KEY_Alt_R,
          65027,
          Gdk.KEY_Super_L,
          Gdk.KEY_Super_R,
          Gdk.KEY_Shift_L,
          Gdk.KEY_Shift_R,
        ];

        if (ignored.includes(event.get_keyval()[1])) return;

        self.visible = false;
      }}
    >
      <box
        // make sure click event does not bubble up
        onButtonPressEvent={() => true}
        // child can be positioned with `halign` `valign` and margins
        expand
        halign={halign}
        valign={valign}
        marginBottom={marginBottom}
        marginTop={marginTop}
        marginStart={marginLeft}
        marginEnd={marginRight}
      >
        {child}
      </box>
    </window>
  );
}
