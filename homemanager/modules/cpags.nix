{
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    ags
    ollama
    pywal
    sassc
    material-symbols
    material-icons
    hypridle
    #hyprlock
    #blueberry
    gtksourceview
    gtk-layer-shell
    gtksourceview4
    cloudflare-warp
    gsettings-desktop-schemas
    matugen
    ydotool
    webkitgtk
    webp-pixbuf-loader
    gtk3
    #materialyoucolor
    (python312.withPackages (p: [
      p.material-color-utilities
      p.pywayland
      p.setproctitle
    ]))
  ];

  programs.hyprlock.enable = true;

}
