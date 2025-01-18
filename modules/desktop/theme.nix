{
  pkgs,
  inputs,
  ...
}: let
  moreWaita = pkgs.stdenv.mkDerivation {
    name = "MoreWaita";
    src = inputs.more-waita;
    installPhase = ''
      mkdir -p $out/share/icons
      mv * $out/share/icons
      # Add Breeze as fallback in index.theme
      sed -i '/^Inherits=/ s/$/,breeze,adwaita/' $out/share/icons/index.theme || echo 'Inherits=breeze,adwaita' >> $out/share/icons/index.theme
    '';
  };

  gabaritoFont = pkgs.stdenv.mkDerivation {
    name = "gabarito-font";
    src = pkgs.fetchurl {
      url = "https://github.com/google/fonts/raw/main/ofl/gabarito/Gabarito%5Bwght%5D.ttf";
      sha256 = "sha256-hlDivXdH99dGGf167LywMJ5vN7eWQCTz+xWuSDO2fKU=";
    };
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out/share/fonts/truetype/google
      cp $src $out/share/fonts/truetype/google/Gabarito-Regular.ttf
    '';
  };
in {
  environment.systemPackages = with pkgs; [
    adwaita-qt6
    adw-gtk3
    adwaita-icon-theme
    moreWaita
    bibata-cursors
    libsForQt5.qt5ct
    qt6ct
    qt6.qtwayland
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  fonts = {
    packages = with pkgs; [
      nerd-fonts.space-mono
      material-icons
      material-symbols
      gabaritoFont
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
      rubik
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
    ];
  };
}
