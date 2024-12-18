{
  pkgs,
  inputs,
  ...
}: let
  gtk-theme = "adw-gtk3-dark";

  moreWaita = pkgs.stdenv.mkDerivation {
    name = "MoreWaita";
    src = inputs.more-waita;
    installPhase = ''
      mkdir -p $out/share/icons
      mv * $out/share/icons
       # Add Breeze as fallback in index.theme
      sed -i '/^Inherits=/ s/$/adwaita/' $out/share/icons/index.theme || echo 'Inherits=adwaita' >> $out/share/icons/index.theme
    '';
  };

  nerdfonts = pkgs.nerdfonts.override {
    fonts = [
      "Ubuntu"
      "UbuntuMono"
      "CascadiaCode"
      "FantasqueSansMono"
      "JetBrainsMono"
      "FiraCode"
      "Mononoki"
      "SpaceMono"
    ];
  };
  google-fonts = pkgs.google-fonts.override {
    fonts = [
      # Sans
      "Gabarito"
      "Lexend"
      # Serif
      "Chakra Petch"
      "Crimson Text"
    ];
  };

  cursor-theme = "Bibata-Modern-Classic";
  cursor-package = pkgs.bibata-cursors;
in {
  stylix = {
    enable = true;
    #image = ../.config/wallpapers/Manga-Portal.png;
    base16Scheme = {
      base00 = "232136";
      base01 = "2a273f";
      base02 = "393552";
      base03 = "6e6a86";
      base04 = "908caa";
      base05 = "e0def4";
      base06 = "e0def4";
      base07 = "56526e";
      base08 = "eb6f92";
      base09 = "f6c177";
      base0A = "ea9a97";
      base0B = "3e8fb0";
      base0C = "9ccfd8";
      base0D = "c4a7e7";
      base0E = "f6c177";
      base0F = "56526e";
    };
    polarity = "dark";
    opacity.terminal = 0.8;
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };

  home = {
    packages = with pkgs; [
      # themes
      adwaita-qt6
      adw-gtk3
      #libsForQt5.breeze-icons
      #gnome-icon-theme
      adwaita-icon-theme
      #adwaita-icon-theme-legacy
      #hicolor-icon-theme
      #material-symbols
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
      google-fonts
      moreWaita
      bibata-cursors
      # morewaita-icon-theme
      # papirus-icon-theme
      # qogir-icon-theme
      # whitesur-icon-theme
      # colloid-icon-theme
      # qogir-theme
      # yaru-theme
      # whitesur-gtk-theme
      # orchis-theme
    ];
    /*
      sessionVariables = {
      XCURSOR_THEME = cursor-theme;
      XCURSOR_SIZE = "24";
    };
    pointerCursor = {
      package = cursor-package;
      name = cursor-theme;
      size = 24;
      gtk.enable = true;
    };
    */
    file = {
      ".local/share/fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      ".fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      # ".config/gtk-4.0/gtk.css" = {
      #   text = ''
      #     window.messagedialog .response-area > button,
      #     window.dialog.message .dialog-action-area > button,
      #     .background.csd{
      #       border-radius: 0;
      #     }
      #   '';
      # };
      ".local/share/icons/MoreWaita" = {
        source = "${moreWaita}/share/icons";
      };
    };
  };

  /*
    gtk = {
    enable = true;
    font = {
      name = "Rubik";
      package = pkgs.google-fonts.override {fonts = ["Rubik"];};
      size = 11;
    };

    theme.name = gtk-theme;
    cursorTheme = {
      name = cursor-theme;
      package = cursor-package;
    };
    iconTheme.name = moreWaita.name;
    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
        border-radius: 0;
      }
    '';
  };
  */

  /*
    qt = {
    enable = true;
    style = {
      name = "adwaita-qt";
      package = pkgs.adwaita-qt;
    };
    platformTheme.name = "gtk";
  };
  */
}
