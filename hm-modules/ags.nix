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
    #blueberry
    gtksourceview
    gtksourceview4
    cloudflare-warp
    gsettings-desktop-schemas
    matugen
    swayidle
    #materialyoucolor
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
      #hicolor-icon-theme
      gtksourceview
      material-symbols
      material-icons
      matugen
      gtksourceview4
      gsettings-desktop-schemas
      ollama
      python312Packages.material-color-utilities
      python312Packages.pywayland
      python312Packages.setproctitle
      pywal
      sassc
      webkitgtk
      swayidle
      webp-pixbuf-loader
      ydotool
    ];
  };

}
