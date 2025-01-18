function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
    cat ~/.cache/ags/user/generated/terminal/sequences.txt
end

zoxide init --cmd cd fish | source

alias cat=bat
alias :q=exit
alias lsgen='sudo nix-env --list-generations --profile /nix/var/nix/profiles/system/'
alias delgen='sudo nix-env --profile /nix/var/nix/profiles/system/ --delete-generations'
alias db=distrobox
alias dbinit='distrobox create --name atlantis -i docker.io/kalilinux/kali-rolling:latest --init'
alias kali='distrobox enter atlantis -- /usr/bin/fish'
alias del='gio trash'
alias dev='nix develop -c nvim'
alias lg=lazygit
alias ga='git add'
alias gb='git branch'
# alias gc='git commit'
alias gch='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gp='git push'
alias gpm='git push -u origin main'
alias gr='git reset --soft HEAD~1'
alias gs='git status'
alias hs='home-manager switch -b backup --flake .#asherah'
alias l=ls
alias la='ls -la'
alias ns='sudo nixos-rebuild switch --flake .#nix'
alias q=exit
alias tree='eza --tree'
alias v=nvim
alias x=clear

# Define completions for gdd
complete -c gdd -f \
    -a "(git diff --name-only --cached; git diff --name-only)"

# Git-aware completions for gc (git commit), showing only modified files
complete -c gc -f -a "(git diff --cached --name-only | grep -P -v '^\?')"

function gdd
    if test (count $argv) -eq 0
        echo "Usage: gdd <file> or <revision> <file>"
        return 1
    end
    bash -c "git diff -- $argv | delta"
end

function gc
    git commit $argv
end

#set -Ux MSF_DATABASE_CONFIG /home/asherah/.msf4/database.yml

set -Ux fish_user_paths /home/asherah/go/bin $fish_user_paths
