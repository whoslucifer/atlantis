{pkgs, ...}: {
  services = {
    xserver.desktopManager.gnome.enable = true;
    xdg.portal.enable = true; #required for flatpak
  };
  programs = {
    hyprland.enable = true;
    xwayland.enable = true;
    nm-applet.indicator = true;
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
