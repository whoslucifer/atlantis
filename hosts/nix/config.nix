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
        pyquery # needed for hyprland-dots Weather script
      ]
  );
in {
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ../../modules/system/misc/intel-drivers.nix
    ../../modules/system/misc/vm-guest-services.nix
    ../../modules/system/misc/local-hardware-clock.nix

    ../../modules/system/locales.nix
    ../../modules/system/networking.nix
    ../../modules/system/boot.nix
    ../../modules/system/boot-loader.nix
    #../../modules/system/laptop.nix

    ../../modules/programs.nix
    ../../modules/virtualization.nix
    ../../modules/extra.nix
    ../../modules/sound.nix
    ../../modules/spotify.nix
    ../../modules/zen-browser.nix
    ../../modules/services.nix
    ../../modules/security.nix

    ../../modules/developer/developer.nix
    ../../modules/developer/mysql.nix
    ../../modules/developer/postgresql.nix

    ../../modules/pentester/pentester.nix
    ../../modules/pentester/blueducky.nix
    ../../modules/pentester/networks.nix
    ../../modules/pentester/ngrok.nix

    ../../modules/utils.nix
  ];

  nixpkgs.config.allowUnfree = true;

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
  system.stateVersion = "24.05";
}
