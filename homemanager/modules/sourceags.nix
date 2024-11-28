{ pkgs, ... }:

pkgs.buildNpmPackage {
  pname = "ags";
  version = "1.8.2";

  src = pkgs.fetchFromGitHub {
    owner = "Aylur";
    repo = "ags";
    rev = "v1.8.2";
    hash = "sha256-ebnkUaee/pnfmw1KmOZj+MP1g5wA+8BT/TPKmn4Dkwc=";
    fetchSubmodules = true;
  };

  npmDepsHash = "sha256-ucWdADdMqAdLXQYKGOXHNRNM9bhjKX4vkMcQ8q/GZ20=";

  nativeBuildInputs = with pkgs; [
    meson
    ninja
    pkg-config
    gobject-introspection
    typescript
  ];

  buildInputs = with pkgs; [
    gjs
    gtk3
    glib-networking
    gnome.gnome-bluetooth
    gtk-layer-shell
    libpulseaudio
    libsoup_3
    linux-pam
    networkmanager
    upower
  ];

  meta = {
    description = "A widget system inspired by EWW";
    homepage = "https://github.com/Aylur/ags";
    license = pkgs.lib.licenses.gpl3Plus;
  };
}

