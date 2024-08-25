export const date = Variable("", {
  poll: [1000, "date '+%d/%m/%y %I:%M:%S %p'"],
});

export default function() {
  return Widget.Label({
    label: date.bind(),
    name: "time-label",
    className: "time__label",
  });
}
