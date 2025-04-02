import { GLib } from "astal";
import { Variable } from "astal";

export default function Time({ format = "%A, %B %e - %H:%M " }) {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format(format)!,
  );

  return (
    <label className="Time" onDestroy={() => time.drop()} label={time()} />
  );
}
