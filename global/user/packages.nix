{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Core Packages
    clang
    curl
    file
    gcc
    git
    killall
    pamixer
    brightnessctl
    unzip
    usbutils
    wget
    zip
    acpi
    inotify-tools
    blueman

    # Standard Packages
    sane-backends
    usb-modeswitch

    # CLI Packages
    playerctl

    # QT
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
