{username, ...}: {
  imports = [
    ./home-manager/default.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  programs.home-manager.enable = true;

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  home.stateVersion = "24.11";
}
