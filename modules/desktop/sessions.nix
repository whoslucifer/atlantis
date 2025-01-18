{pkgs, ...}: {
  services = {
    # xserver.desktopManager.gnome.enable = true;
  };

  programs = {
    hyprland.enable = true;
    xwayland.enable = true;
    nm-applet.indicator = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
  };

  environment.systemPackages = with pkgs; [
    xwayland
    anyrun
    nautilus
    brightnessctl
    swww
    swaylock-effects
    swayidle
    playerctl
    wlsunset
    wl-clipboard
    wf-recorder
    swappy
    wayshot
    slurp
    pavucontrol
    ydotool
  ];
}
