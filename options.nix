{
  username = "asherah";
  systemConfig = {
    hostname = "nix";
    locale = "en_US.UTF-8";
    timezone = "Africa/Nairobi";
  };

  userConfig = rec {
    theme = "catppuccin-mocha"; # [catppuccin-mocha|gruvbox]
    notificationDaemon = "ags"; # [dunst|ags]
    wm = {
      qtile.enable = false;
      hyprland.enable = true;
    };
    terminal = {
      # Kitty works on both wayland & x11, but foot is wayland only
      kitty.enable = wm.qtile.enable;
      foot.enable = wm.hyprland.enable;
    };
  };
}
