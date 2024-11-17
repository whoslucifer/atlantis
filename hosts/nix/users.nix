{
  pkgs,
  username,
  ...
}: let
  inherit (import ./variables.nix) gitUsername;
in {
  users = {
    users."${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
        "docker"
        "wireshark"
        "dialout"
      ];

      # define user packages here
      packages = with pkgs; [
      ];
    };

    # create groups that arent created
    groups = {
      scanner = {};
      libvirtd = {};
      wireshark = {};
      dialout = {};
    };

    defaultUserShell = pkgs.fish;
  };

  programs.fish.enable = true;

  environment.shells = with pkgs; [fish];
  #environment.systemPackages = with pkgs; [fzf];
}
