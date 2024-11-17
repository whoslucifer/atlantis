{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    slack
    zoom-us
    discord
  ];
}
