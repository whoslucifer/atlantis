{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    ollama
    pywal
    sassc
    material-symbols
    material-icons
    gtksourceview
    gtksourceview4
    gsettings-desktop-schemas
    matugen
    swayidle
    (python312.withPackages (p: [
      p.material-color-utilities
      p.pywayland
    ]))
  ];

  programs.ags = {
    enable = true;
    configDir = null; # if ags dir is managed by home-manager, it'll end up being read-only. not too cool.
    # configDir = ./../.config/ags;

    extraPackages = with pkgs; [
      gtksourceview
      material-symbols
      material-icons
      matugen
      gtksourceview4
      gsettings-desktop-schemas
      ollama
      pywal
      sassc
      webkitgtk
      swayidle
      webp-pixbuf-loader
      ydotool
      bc
      ddcutil
      blueberry
      (python312.withPackages (p: [
        p.materialyoucolor
        p.pillow
        p.setproctitle
        p.pywayland
      ]))
    ];
  };
}
