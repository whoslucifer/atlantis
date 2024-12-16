{...}: {
  imports = [
    ./ags.nix
    ./anyrun.nix
    ./hyprland.nix

    ./shell.nix
    ./tmux.nix
    ./wezterm.nix
    ./neovim.nix
    ./fzf.nix
    ./starship.nix

    ./default/obs-studio.nix

    #./stylix.nix
    ./xdg.nix
    ./theme.nix
    #./git.nix
    #./zoom.nix
    ./media.nix
    ./productivity.nix
    ./socials.nix
    #./nautilus.nix
    ./lazygit.nix
    #./browser.nix

    #./terminals.nix
    ./packages.nix
    #./insecure.nix
    ./developer/go.nix
  ];
}
