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
in {
  # Add packages to the system
  environment.systemPackages = with pkgs; [
    adwaita-qt6
    adw-gtk3
    adwaita-icon-theme
    moreWaita
    bibata-cursors
  ];

  # Install fonts using fonts.packages
  fonts = {
    packages = with pkgs; [
      nerd-fonts.space-mono
      nerd-fonts.ubuntu
      nerd-fonts.jetbrains-mono
      rubik
      #google-fonts.Gabarito
      #google-fonts.Lexend
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
    ];
  };
}
