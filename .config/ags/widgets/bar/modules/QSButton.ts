export default Widget.Button({
  class_name: "qs-button",
  onPrimaryClick: () => App.toggleWindow("quicksettings"),
  child: Widget.Label({
    class_name: "qs icon",
    label: " ",
  }),
});
