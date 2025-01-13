{
  config,
  pkgs,
  ...
}: let
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
  fonts.packages = [gabaritoFont]; # Ensure the font is available system-wide.
}
