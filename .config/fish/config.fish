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

function delgen
    sudo nix-env --profile /nix/var/nix/profiles/system/ --delete-generations
end

function lsgen
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system/
end

#set -Ux MSF_DATABASE_CONFIG /home/asherah/.msf4/database.yml

set -Ux fish_user_paths /home/asherah/go/bin $fish_user_paths
# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end
