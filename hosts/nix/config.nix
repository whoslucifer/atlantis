# this is the main default config
{
  config,
  pkgs,
  host,
  username,
  options,
  lib,
  inputs,
  system,
  ...
}: let
  inherit (import ./variables.nix) keyboardLayout;
  python-packages = pkgs.python3.withPackages (
    ps:
      with ps; [
        requests
        ninja
        pyquery # needed for hyprland-dots Weather script
      ]
  );
in {
  imports = [
    ./default.nix
    ../../modules/default.nix  
  
  ];

  nixpkgs.config.allowUnfree = true;
  #nixpkgs.config.allowUnsupportedSystem = true;

  # System Users
  users = {
    mutableUsers = true;
  };

  # Python Packages for Hyprland scripts
  environment.systemPackages =
    (with pkgs; [
      vim
      home-manager
    ])
    ++ [
      python-packages
    ];

  # System version
  system.stateVersion = "24.11";
}
