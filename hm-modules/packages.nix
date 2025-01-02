{
  config,
  pkgs,
  inputs,
  ...
}: {
  home = {
    packages = with pkgs;
    with nodePackages_latest;
    with libsForQt5; [
      #gui
      (mpv.override {scripts = [mpvScripts.mpris];})
      d-spy
      #figma-linux
      kolourpaint
      #github-desktop
      nautilus
      yazi
      icon-library
      dconf-editor
      qt5.qtimageformats
      totem
      loupe
      vlc
      yad
      swaylock-effects

      ifuse
      libimobiledevice
      usbmuxd

      protonvpn-gui
      fastfetch

      onlyoffice-bin
      libreoffice-fresh
      audacity
      spotdl
      delta
      switcheroo # converts image types
      celeste #connect and sync cloud drives to you pc
      handbrake #video format converter
      impression #rufus alternative
      easyeffects
      textpieces #text encoder and decoder
      mousai # shazam alternative
      gimp
      bat
      eza
      fd
      ripgrep
      #fzf
      socat
      tlrc
      jq
      gojq
      acpi
      ffmpeg
      libnotify
      #killall
      zip
      unzip
      glib
      foot
      starship
      showmethekey
      vscode
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
  };
}
