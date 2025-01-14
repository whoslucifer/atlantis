$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

load-env {
    "EDITOR": "nvim"
    "NIXPKGS_ALLOW_INSECURE": "1"
    "NIXPKGS_ALLOW_UNFREE": "1"
    "PROMPT_COMMAND": ""
    "PROMPT_COMMAND_RIGHT": ""
    "PROMPT_INDICATOR_VI_INSERT": "  "
    "PROMPT_INDICATOR_VI_NORMAL": "∙ "
    "SHELL": "/nix/store/pd6jq1nwzyzf9wyh5vlclw0br20mbi4p-nushell-0.100.0/bin/nu"
    "VISUAL": "nvim"
}

