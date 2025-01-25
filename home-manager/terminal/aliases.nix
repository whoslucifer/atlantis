let
  nixprofile_path = "/nix/var/nix/profiles/system";
in {
  # General
  c = "clear";
  cat = "bat";
  e = "exit";
  pk = "pkill";

  # File Management
  ls = "eza --group-directories-first --icons";
  lf = "yazi";

  # Note editor
  nvide = "neovide";

  #Github
  lz = "lazygit";

  # Trash: trash-cli
  rm = "trash-put";
  tre = "trash-empty";
  trl = "trash-list";
  trp = "trash-put";
  trr = "trash-restore";

  # GPG
  encrypt = "gpg --encrypt --armor --sign -r";
  decrypt = "gpg --decrypt";
  public-keys = "gpg --list-public-keys";
  secret-keys = "gpg --list-secret-keys";
  all-keys = "gpg --list-keys";

  # NIX
  hm-rebuild = "home-manager switch -b backup --flake .";
  hm-rebuild-stylix = "home-manager switch -b backup --flake . && ~/.swww-stylix";
  nix-rebuild = "sudo nixos-rebuild switch --flake .#default";
  nixos-gens = "sudo nix-env --list-generations --profile ${nixprofile_path}";
  nixos-gens-rm = "sudo nix-env --profile ${nixprofile_path} --delete-generations";

  # Misc
  orphan = "nohup '$@' >/dev/null 2>&1 & disown";
  font-list = "fc-list : family | fzf | tr -d '\\n'";
}
