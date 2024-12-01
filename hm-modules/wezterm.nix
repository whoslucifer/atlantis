{  pkgs, ...}: let
  wezterm_config = ./../.config/wezterm;
in {

  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile = {
    "wezterm" = {
      recursive = true;
      source = "${wezterm_config}";
    };
  };
}
