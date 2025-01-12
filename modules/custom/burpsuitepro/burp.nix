{
  pkgs,
  lib,
  ...
}: let
  burpsuite = import ./burpsuitepro.nix {
    inherit (pkgs) lib buildFHSEnv fetchurl jdk makeDesktopItem unzip;
    proEdition = true;
  };
in {
  environment.systemPackages = with pkgs; [burpsuite];
}
