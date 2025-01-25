const Brightness = {
  get current() {
    const result = GLib.spawn_command_line_sync("brightnessctl g");
    const max = GLib.spawn_command_line_sync("brightnessctl m");
    if (result[0] && max[0]) {
      const current = parseInt(result[1].toString().trim());
      const maximum = parseInt(max[1].toString().trim());
      return current / maximum;
    }
    return 0;
  },
};

let startupVisibility = false;

setTimeout(() => {
  startupVisibility = true;
}, 2000);

const Slider = Widget.Box({
  class_name: "osd-bar",
  vertical: true,
  children: [
    Widget.Icon().hook(null, (self) => {
      self.class_name = "osd-icon";
      const brightness = Brightness.current * 100;
      const icon = [
        [67, "high"],
        [34, "medium"],
        [1, "low"],
        [0, "off"],
      ].find(([threshold]) => threshold <= brightness)?.[1];

      self.icon = `display-brightness-${icon}-symbolic`;
    }),
    Widget.LevelBar({
      vexpand: true,
      inverted: true,
      vertical: true,
      hpack: "center",
      setup: (self) =>
        self.hook(null, (self) => {
          const brightness = Brightness.current * 100;
          self.value = Math.floor(brightness) / 100;
        }),
    }),
  ],
});

export default () =>
  Widget.Window({
    name: "obd",
    layer: "overlay",
    clickThrough: true,
    anchor: ["right"],
    child: Widget.Box({
      class_name: "osd-bar-container",
      child: Widget.Revealer({
        revealChild: false,
        transitionDuration: 1000,
        child: Slider,
        setup: (self) => {
          let count = -1;
          const updateBrightness = () => {
            if (!startupVisibility) {
              return;
            }
            if (count < 0) count = 0;
            self.reveal_child = true;
            count++;
            Utils.timeout(2000, () => {
              count--;
              if (count === 0) self.reveal_child = false;
            });
          };

          GLib.timeout_add(GLib.PRIORITY_DEFAULT, 1000, () => {
            updateBrightness();
            return true;
          });
        },
      }),
    }),
  });

