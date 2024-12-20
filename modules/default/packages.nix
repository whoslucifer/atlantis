{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gparted

    wezterm
    xwayland
    blender
    google-chrome
    teams-for-linux
    localsend
    #plasma5Packages.kdeconnect-kde
    kdePackages.kdeconnect-kde

    pkgconf
    pkg-config
    dbus-glib

    xorg.xhost # distrobox kali xfce

    #for ags new
    cloudflare-warp
    cloudflared
    pinokio #installs ai tools locally
  ];
}
