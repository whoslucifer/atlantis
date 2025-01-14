$env.config = {"cursor_shape":{"vi_insert":"line","vi_normal":"block"},"display_errors":{"exit_code":false},"edit_mode":"vi","keybindings":[{"event":[{"cmd":"do {\n                  $env.SHELL = '/usr/bin/bash'\n                  commandline edit --insert (\n                    history\n                    | get command\n                    | reverse\n                    | uniq\n                    | str join (char -i 0)\n                    | fzf --scheme=history \n                    --read0\n                    --layout=reverse\n                    --height=40%\n                    --bind 'ctrl-/:change-preview-window(right,70%|right)'\n                    --preview='echo -n {} | nu --stdin -c 'nu-highlight''\n                    # Run without existing commandline query for now to test composability\n                    # -q (commandline)\n                    | decode utf-8\n                    | str trim\n                  )\n                }","send":"ExecuteHostCommand"}],"keycode":"char_r","mode":["emacs","vi_normal","vi_insert"],"modifier":"control","name":"fuzzy_history"}],"ls":{"clickable_links":true},"menus":[{"marker":"? ","name":"completion_menu","only_buffer_difference":false,"style":{"description_text":"yellow","selected_text":"blue_reverse","text":"magenta"},"type":{"col_padding":2,"columns":4,"layout":"columnar"}}],"rm":{"always_trash":true},"show_banner":false,"table":{"header_on_separator":false,"index_mode":"always","mode":"rounded"}};

source ~/.cache/carapace/init.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

zoxide init --cmd cd nushell | save -f ~/.zoxide.nu

source ~/.zoxide.nu

const path = "~/.nushellrc.nu"
const null = "/dev/null"
source (if ($path | path exists) {
    $path
} else {
    $null
})

alias :q = exit
alias cat = bat
alias db = distrobox
alias del = gio trash
alias dev = nix develop -c nvim
alias ga = git add
alias gb = git branch
alias gc = git commit
alias gch = git checkout
alias gcl = git clone
alias gd = git diff
alias gdd = bash -c 'git diff "$@" | delta' _
alias gp = git push
alias gpm = git push -u origin main
alias gr = git reset --soft HEAD~1
alias gs = git status
alias hs = home-manager switch -b backup --flake .#asherah
alias kali = distrobox enter kalignome -- /snap/bin/nu
alias l = ls
alias la = ls -la
alias ns = sudo nixos-rebuild switch --flake .#nix
alias q = exit
alias tree = eza --tree
alias v = nvim
alias x = clear
