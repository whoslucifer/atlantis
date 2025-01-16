{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
  with nodePackages_latest;
  with libsForQt5; [
    gnumake

    ghostty
    anyrun
    jq
    tmux
    wezterm
    git
    nix-prefetch-git

    xwayland
    google-chrome
    ani-cli
    manga-cli
    yt-dlp
    telegram-desktop
    vesktop
    discord
    burpsuite
    localsend

    starship
    #for ags new
    ##cloudflare-warp
    #cloudflared
    (mpv.override {scripts = [mpvScripts.mpris];})
    d-spy
    #figma-linux
    kolourpaint
    #github-desktop
    nautilus
    icon-library
    dconf-editor
    qt5.qtimageformats
    yad
    swaylock-effects

    protonvpn-gui

    #libreoffice-fresh
    impression
    spotdl
    delta
    #impression #rufus alternative
    bat
    eza
    fd
    ripgrep
    fzf
    tlrc
    acpi
    ffmpeg
    libnotify
    gobject-introspection
    #killall
    zip
    unzip
    glib
    ydotool

    #ddmp
    zoxide
    file
    entr

    # theming tools
    gradience
    gnome-tweaks

    # hyprland
    brightnessctl
    cliphist
    fuzzel
    grim
    hyprpicker
    tesseract
    imagemagick
    pavucontrol
    playerctl
    swappy
    slurp
    swww
    wayshot
    wlsunset
    wl-clipboard
    wf-recorder
  
    pkg-config
    kitty

    # langs
    gjs
    bun
    cargo
    #typescript
    eslint
    # very important stuff
    uwuify

    #ags new dots
    ddcutil
    bc
    sass
    unixtools.top
  ];
}
