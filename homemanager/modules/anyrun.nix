{  pkgs, ...}: let
  anyrun_config = ./../../.config/anyrun;
in {

  home.packages = with pkgs; [
    anyrun
  ];

  # Source anyrun config from the home-manager store
  xdg.configFile = {
    "anyrun" = {
      recursive = true;
      source = "${anyrun_config}";
    };
  };
}
