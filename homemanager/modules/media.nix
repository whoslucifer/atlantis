{pkgs, ...}: {
  programs.firefox.enable = true;

  home.packages = with pkgs; [
    ani-cli
    manga-cli
    vlc
    yt-dlp

    chromium
    google-chrome
    brave
  ];
}
