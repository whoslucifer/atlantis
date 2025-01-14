{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    btrfs-progs
    curl
    wget
    btop
    htop
    gnumake
    cpufrequtils
    glib #for gsettings to work
    gsettings-qt
    killall
    libappindicator
    pciutils
    xdg-user-dirs
    usbutils
    iw # networking
    inxi
  ];
}
