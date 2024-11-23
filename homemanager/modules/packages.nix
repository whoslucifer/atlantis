{ config, pkgs, inputs, ...}: {
  home = {
    packages = with pkgs;
    with nodePackages_latest;
    with gnome;
    with libsForQt5; [
      #gui
      (mpv.override {scripts = [mpvScripts.mpris];})
      d-spy
      dolphin
      #figma-linux
      kolourpaint
      #github-desktop
      nautilus
      icon-library
      dconf-editor
      qt5.qtimageformats
      totem
      loupe
      vlc
      yad

      # tools
      localsend
      thunderbird
      metadata-cleaner
      onlyoffice-bin
      audacity
      switcheroo # converts image types
      celeste #connect and sync cloud drives to you pc
      syncthing # sync your files on devices on the same network
      handbrake #video format converter
      impression #rufus alternative
      ventoy #installs onto a flashdrive and allows storing more that 1 bootable iso on it
      hypnotix # iptv streaming application
      #qt5.spectacle #screenshot service that allows annotations
      #qt5.kdeconnect-kde
      easyeffects
      upscayl #offline image upscaler
      textpieces #text encoder and decoder
      onionshare-gui
      #onionshare # share files over tor and host a website on the tor network
      mousai # shazam alternative
      stirling-pdf # best pdf actions tool
      piper # reassign mouse buttons
      gimp
      bat
      eza
      fd
      ripgrep
      #fzf
      socat
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
      yad
      file
      #toybox
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
