{ pkgs }:

let
  imgLink = "https://img.freepik.com/free-photo/morskie-oko-tatry_1204-510.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "05g7zk10li2d2qfzxlrp16cvh5lbi0vs7lz9wwsvp9li35i21w6n";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "whoslucifer";
    repo = "SDDM-NIX";
    rev = "29f7eae254a312b656e9c18c3d1485c30b6edf40";
    sha256 = "1rwl7ka6y1hl5yc7xcjarb6lwhjb2n2fnd0lqjiqqfdamszmcaws";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    #rm background.jpg
    #rm README.md
    #cp -r #$#{#image} $out/background.jpg
   '';

}

