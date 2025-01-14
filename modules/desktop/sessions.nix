{pkgs, ...}: {
  services = {
    xserver.desktopManager.gnome.enable = true;
  };

  programs = {
    hyprland.enable = true;
    xwayland.enable = true;
    nm-applet.indicator = true;
  };

  xdg.portal.enable = true; #required for flatpak

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
