{
  inputs,
  pkgs,
  system,
  ...
}: let
  agsWithDeps = inputs.ags.packages.${system}.default.overrideAttrs (oldAttrs: {
    buildInputs =
      oldAttrs.buildInputs
      ++ [
        pkgs.gtksourceview3
        pkgs.gtk3
        pkgs.zlib
        pkgs.gobject-introspection
        pkgs.ollama
        pkgs.pywal
        pkgs.sassc
        pkgs.material-symbols
        pkgs.gobject-introspection
        pkgs.material-icons
        pkgs.gtksourceview
        pkgs.gtksourceview3
        pkgs.gtksourceview4
        pkgs.gsettings-desktop-schemas
        pkgs.matugen
        pkgs.swayidle
        pkgs.webp-pixbuf-loader
        pkgs.ydotool
        pkgs.webkitgtk
        pkgs.python312Packages.materialyoucolor
      ];
  });
in {
  environment.systemPackages = [
    agsWithDeps
    pkgs.material-icons
    pkgs.swayidle
    pkgs.material-symbols
    (pkgs.python312.withPackages (p: [
      p.materialyoucolor
      p.pillow
      p.pywayland
      p.setproctitle
    ]))
  ];
}
