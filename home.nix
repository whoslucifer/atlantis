{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hm-modules/default.nix
  ];

  home.username = "asherah";
  home.homeDirectory = "/home/asherah";

  home.packages = let
    nerdfonts = pkgs.nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    };
  in [nerdfonts];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
    NIXOS_OZONE_WL = "1"; # for electron apps to use wayland
    TERMINAL = "wezterm";
    VISUAL = "nvim";
  };

  /*
    services.gammastep = {
    enable = true;
    dawnTime = "08:00";
    duskTime = "08:00";
  };
  */

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #home.enableNixpkgsReleaseCheck = false;

  home.stateVersion = "24.11";
}
