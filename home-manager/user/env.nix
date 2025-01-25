{config, ...}: {
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
    TERMINAL = "wezterm";
    VISUAL = "nvim";
    NIXOS_OZONE_WL = "1";
    GOPATH = "${config.home.homeDirectory}/.local/share/go";
    GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
    VOLTA_HOME = "${config.home.homeDirectory}/.volta";
  };
}
