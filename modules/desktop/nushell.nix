{pkgs}: {
  environment.systemPackages = with pkgs; [
    tmux
    carapace
    starship
    bat
    eza
    ripgrep
    fzf
    tlrc
    zoxide
    cliphist
  ];
}
