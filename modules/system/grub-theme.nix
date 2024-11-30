{ pkgs }:

let
  imgLink = "https://images.alphacoders.com/134/1343746.png";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "15ggra0axy433w3y2y2v7adhjf1c29hk27rhgc3cqczyxs5ps4rk";
  };
in
pkgs.stdenv.mkDerivation {
  name = "grub-theme";
  src = pkgs.fetchFromGitHub {
    owner = "whoslucifer";
    repo = "GRUB-NIX";
    rev = "5eee7a495346bfd0bcc669b9eb641f0f0f54f36f";
    sha256 = "0zyk4jgqpa1zrq6rhzxk69c3128fsakjkfn7im9bnc19ibv0hlrk";
  };
  installPhase = ''
    mkdir -p $out
    cp -r Sekiro $out/
    cd $out/
    rm grub.png
    cp -r ${image} $out/grub.png
   '';

}

