# burpsuitepro.nix
{
  stdenv,
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    (pkgs.stdenv.mkDerivation {
      name = "burpsuitepro";
      src = pkgs.fetchFromGitHub {
        owner = "whoslucifer";
        repo = "BURPSUITEPRO-NIX";
        rev = "639b6c4b0b60d86b8147c12b1e6a72c5273748ca";
        sha256 = "0qz2jfnl5xr5nr9iy2vnqirjpjl2gipyjjhbzvlislvsavhsyrah";
      };

      buildInputs = [pkgs.wget pkgs.curl pkgs.openjdk pkgs.git];

      installPhase = ''
        mkdir -p $out/bin

        wget "https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar&version=&" -O burpsuite_pro.jar --quiet --show-progress

        # Execute Burp Suite Professional
        cp ./burpsuitepro $out/bin
      '';
    })
  ];
}
