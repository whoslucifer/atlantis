import { cpuUsage } from "module-vars/cpu";
import { memUsage } from "module-vars/mem";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";

const CpuUsage = () =>
  Widget.Box({
    class_name: "cpu-usage",
    children: [
      Widget.Label({
        class_name: "icon",
        label: " ",
      }),
      Widget.Label({
        class_name: "value",
        setup: (self) =>
          self.hook(cpuUsage, () => {
            self.label = `${Math.round(cpuUsage.value)}%`;
          }),
      }),
    ],
  });

const divide = (num1: number, num2: number) => (num1 / num2).toFixed(1);

const MemoryUsage = () =>
  Widget.Box({
    class_name: "memory-usage",
    children: [
      Widget.Label({
        class_name: "icon",
        label: " ",
      }),
      Widget.Label({
        class_name: "value",
        setup: (self) =>
          self.hook(memUsage, () => {
            const used = (memUsage.value.used / 1024).toFixed(0);
            self.label = `${used} MiB`;
          }),
      }),
    ],
  });

const BatteryUsage = () =>
  Widget.Box({
    class_name: "battery-usage",
    children: [
      Widget.Label({
        class_name: "icon",
        label: " ",
      }),
      Widget.Label({
        class_name: "value",
        setup: (self) =>
          self.hook(Battery, () => {
            if (Battery.available && Battery.percent >= 0) {
              self.label = `${Battery.percent}%`;
            } else {
              self.label = "Battery not detected";
            }
          }),
      }),
    ],
  });


export { CpuUsage, MemoryUsage, BatteryUsage };
