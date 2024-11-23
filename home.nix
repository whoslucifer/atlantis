{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    #./homemanager/modules/terminals.nix
    ./homemanager/modules/tmux.nix
    ./homemanager/modules/neovim.nix
    ./homemanager/modules/theme.nix
    ./homemanager/modules/packages.nix
    ./homemanager/modules/fzf.nix
    #./homemanager/modules/git.nix
    #./homemanager/modules/zoom.nix
    ./homemanager/modules/ags.nix
    ./homemanager/modules/hyprland.nix
    #./homemanager/modules/stylix.nix
    ./homemanager/modules/anyrun.nix
    ./homemanager/modules/lazygit.nix
    ./homemanager/modules/xdg.nix

    ./homemanager/modules/socials.nix
    #./homemanager/modules/nautilus.nix
    ./homemanager/modules/media.nix
    ./homemanager/modules/productivity.nix
    #./homemanager/modules/insecure.nix

    ./homemanager/modules/developer/go.nix
    ./homemanager/modules/starship.nix
    #./homemanager/modules/browser.nix
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

  home.stateVersion = "24.05";
}
