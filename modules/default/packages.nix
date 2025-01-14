{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
  with nodePackages_latest;
  with libsForQt5; [
    ghostty
    wezterm

    google-chrome
    ani-cli
    dig
    traceroute
    manga-cli
    git
    yt-dlp
    telegram-desktop
    vesktop
    localsend

    nix-prefetch-git
    (mpv.override {scripts = [mpvScripts.mpris];})
    d-spy
    #figma-linux
    icon-library
    dconf-editor
    qt5.qtimageformats

    protonvpn-gui

    #libreoffice-fresh
    impression
    spotdl
    delta
    #impression #rufus alternative
    fd
    acpi
    ffmpeg
    #killall
    zip
    unzip

    #ddmp
    file
    entr

    # theming tools
    # gnome-tweaks

    # hyprland
    #tesseract
    #imagemagick

    # langs
    gjs
    bun
    cargo
    #typescript
    eslint
    # very important stuff
    uwuify
  ];
}
