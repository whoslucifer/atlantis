const { GLib } = imports.gi;
import App from 'resource:///com/github/Aylur/ags/app.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';

import Bluetooth from 'resource:///com/github/Aylur/ags/service/bluetooth.js';
import Network from 'resource:///com/github/Aylur/ags/service/network.js';
const { execAsync, exec } = Utils;
import { BluetoothIndicator, NetworkIndicator } from '../.commonwidgets/statusicons.js';
import { setupCursorHover } from '../.widgetutils/cursorhover.js';
import { MaterialIcon } from '../.commonwidgets/materialicon.js';
import { sidebarOptionsStack } from './sideright.js';

export const ToggleIconWifi = (props = {}) => Widget.Button({
    className: 'txt-small sidebar-iconbutton',
    tooltipText: getString('Wifi | Right-click to configure'),
    onClicked: () => Network.toggleWifi(),
    onSecondaryClickRelease: () => {
        execAsync(['bash', '-c', `${userOptions.apps.network}`]).catch(print);
        closeEverything();
    },
    child: NetworkIndicator(),
    setup: (self) => {
        setupCursorHover(self);
        self.hook(Network, button => {
            button.toggleClassName('sidebar-button-active', [Network.wifi?.internet, Network.wired?.internet].includes('connected'))
            button.tooltipText = (`${Network.wifi?.ssid} | ${getString("Right-click to configure")}` || getString('Unknown'));
        });
    },
    ...props,
});

export const ToggleIconBluetooth = (props = {}) => Widget.Button({
    className: 'txt-small sidebar-iconbutton',
    tooltipText: getString('Bluetooth | Right-click to configure'),
    onClicked: () => {
        const status = Bluetooth?.enabled;
        if (status)
            exec('rfkill block bluetooth');
        else
            exec('rfkill unblock bluetooth');
    },
    onSecondaryClickRelease: () => {
        execAsync(['bash', '-c', `${userOptions.apps.bluetooth}`]).catch(print);
        closeEverything();
    },
    child: BluetoothIndicator(),
    setup: (self) => {
        setupCursorHover(self);
        self.hook(Bluetooth, button => {
            button.toggleClassName('sidebar-button-active', Bluetooth?.enabled)
        });
    },
    ...props,
});

export const HyprToggleIcon = async (icon, name, hyprlandConfigValue, props = {}) => {
    try {
        return Widget.Button({
            className: 'txt-small sidebar-iconbutton',
            tooltipText: `${name}`,
            onClicked: (button) => {
                // Set the value to 1 - value
                Utils.execAsync(`hyprctl -j getoption ${hyprlandConfigValue}`).then((result) => {
                    const currentOption = JSON.parse(result).int;
                    execAsync(['bash', '-c', `hyprctl keyword ${hyprlandConfigValue} ${1 - currentOption} &`]).catch(print);
                    button.toggleClassName('sidebar-button-active', currentOption == 0);
                }).catch(print);
            },
            child: MaterialIcon(icon, 'norm', { hpack: 'center' }),
            setup: button => {
                button.toggleClassName('sidebar-button-active', JSON.parse(Utils.exec(`hyprctl -j getoption ${hyprlandConfigValue}`)).int == 1);
                setupCursorHover(button);
            },
            ...props,
        })
    } catch {
        return null;
    }
}

export const ModuleNightLight = async (props = {}) => {
    if (!exec(`bash -c 'command -v wlsunset'`)) return null;
    return Widget.Button({
        attribute: {
            enabled: false,
        },
        className: 'txt-small sidebar-iconbutton',
        tooltipText: getString('Night Light'),
        onClicked: (self) => {
            self.attribute.enabled = !self.attribute.enabled;
            self.toggleClassName('sidebar-button-active', self.attribute.enabled);
            if (self.attribute.enabled) Utils.execAsync('wlsunset').catch(print)
            else Utils.execAsync('pkill wlsunset')
                .then(() => {
                    // disable the button until fully terminated to avoid race
                    self.sensitive = false;
                    const source = setInterval(() => {
                        Utils.execAsync('pkill -0 wlsunset')
                            .catch(() => {
                                self.sensitive = true;
                                source.destroy();
                            });
                    }, 500);
                })
                .catch(print);
        },
        child: MaterialIcon('nightlight', 'norm'),
        setup: (self) => {
            setupCursorHover(self);
            self.attribute.enabled = !!exec('pidof gammastep');
            self.toggleClassName('sidebar-button-active', self.attribute.enabled);
        },
        ...props,
    });
}

export const ModuleCloudflareWarp = async (props = {}) => {
    if (!exec(`bash -c 'command -v warp-cli'`)) return null;
    return Widget.Button({
        attribute: {
            enabled: false,
        },
        className: 'txt-small sidebar-iconbutton',
        tooltipText: getString('Cloudflare WARP'),
        onClicked: (self) => {
            self.attribute.enabled = !self.attribute.enabled;
            self.toggleClassName('sidebar-button-active', self.attribute.enabled);
            if (self.attribute.enabled) Utils.execAsync('sudo warp-svc && warp-cli connect').catch(print)
            else Utils.execAsync('warp-cli disconnect && sudo pkill warp-svc').catch(print);
        },
        child: Widget.Icon({
            icon: 'cloudflare-dns-symbolic',
            className: 'txt-norm',
        }),
        setup: (self) => {
            setupCursorHover(self);
            self.attribute.enabled = !exec(`bash -c 'warp-cli status | grep Disconnected'`);
            self.toggleClassName('sidebar-button-active', self.attribute.enabled);
        },
        ...props,
    });
}

export const ModuleInvertColors = async (props = {}) => {
    try {
        const Hyprland = (await import('resource:///com/github/Aylur/ags/service/hyprland.js')).default;
        return Widget.Button({
            className: 'txt-small sidebar-iconbutton',
            tooltipText: getString('Color inversion'),
            onClicked: (button) => {
                // const shaderPath = JSON.parse(exec('hyprctl -j getoption decoration:screen_shader')).str;
                Hyprland.messageAsync('j/getoption decoration:screen_shader')
                    .then((output) => {
                        const shaderPath = JSON.parse(output)["str"].trim();
                        if (shaderPath != "[[EMPTY]]" && shaderPath != "") {
                            execAsync(['bash', '-c', `hyprctl keyword decoration:screen_shader '[[EMPTY]]'`]).catch(print);
                            button.toggleClassName('sidebar-button-active', false);
                        }
                        else {
                            Hyprland.messageAsync(`j/keyword decoration:screen_shader ${GLib.get_user_config_dir()}/hypr/shaders/invert.frag`)
                                .catch(print);
                            button.toggleClassName('sidebar-button-active', true);
                        }
                    })
            },
            child: MaterialIcon('invert_colors', 'norm'),
            setup: setupCursorHover,
            ...props,
        })
    } catch {
        return null;
    };
}

export const ModuleRawInput = async (props = {}) => {
    try {
        const Hyprland = (await import('resource:///com/github/Aylur/ags/service/hyprland.js')).default;
        return Widget.Button({
            className: 'txt-small sidebar-iconbutton',
            tooltipText: 'Raw input',
            onClicked: (button) => {
                Hyprland.messageAsync('j/getoption input:accel_profile')
                    .then((output) => {
                        const value = JSON.parse(output)["str"].trim();
                        if (value != "[[EMPTY]]" && value != "") {
                            execAsync(['bash', '-c', `hyprctl keyword input:accel_profile '[[EMPTY]]'`]).catch(print);
                            button.toggleClassName('sidebar-button-active', false);
                        }
                        else {
                            Hyprland.messageAsync(`j/keyword input:accel_profile flat`)
                                .catch(print);
                            button.toggleClassName('sidebar-button-active', true);
                        }
                    })
            },
            child: MaterialIcon('mouse', 'norm'),
            setup: setupCursorHover,
            ...props,
        })
    } catch {
        return null;
    };
}

export const ModuleIdleInhibitor = (props = {}) => Widget.Button({ // TODO: Make this work
    attribute: {
        enabled: false,
    },
    className: 'txt-small sidebar-iconbutton',
    tooltipText: getString('Keep system awake'),
    onClicked: (self) => {
        self.attribute.enabled = !self.attribute.enabled;
        self.toggleClassName('sidebar-button-active', self.attribute.enabled);
        if (self.attribute.enabled) Utils.execAsync(['bash', '-c', `pidof wayland-idle-inhibitor.py || ${App.configDir}/scripts/wayland-idle-inhibitor.py`]).catch(print)
        else Utils.execAsync('pkill -f wayland-idle-inhibitor.py').catch(print);
    },
    child: MaterialIcon('coffee', 'norm'),
    setup: (self) => {
        setupCursorHover(self);
        self.attribute.enabled = !!exec('pidof wayland-idle-inhibitor.py');
        self.toggleClassName('sidebar-button-active', self.attribute.enabled);
    },
    ...props,
});

export const ModuleReloadIcon = (props = {}) => Widget.Button({
    ...props,
    className: 'txt-small sidebar-iconbutton',
    tooltipText: getString('Reload Environment config'),
    onClicked: () => {
        execAsync(['bash', '-c', 'hyprctl reload || swaymsg reload &']);
        App.closeWindow('sideright');
    },
    child: MaterialIcon('refresh', 'norm'),
    setup: button => {
        setupCursorHover(button);
    }
})

export const ModuleSettingsIcon = (props = {}) => Widget.Button({
    ...props,
    className: 'txt-small sidebar-iconbutton',
    tooltipText: getString('Open Settings'),
    onClicked: () => {
        execAsync(['bash', '-c', `${userOptions.apps.settings}`, '&']);
        App.closeWindow('sideright');
    },
    child: MaterialIcon('settings', 'norm'),
    setup: button => {
        setupCursorHover(button);
    }
})

export const ModulePowerIcon = (props = {}) => Widget.Button({
    ...props,
    className: 'txt-small sidebar-iconbutton',
    tooltipText: getString('Session'),
    onClicked: () => {
        closeEverything();
        Utils.timeout(1, () => openWindowOnAllMonitors('session'));
    },
    child: MaterialIcon('power_settings_new', 'norm'),
    setup: button => {
        setupCursorHover(button);
    }
})
