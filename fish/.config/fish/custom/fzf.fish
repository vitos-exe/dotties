#fzf.fish extra config
if type -q fzf_configure_bindings
    fzf_configure_bindings --directory=\cf --git_status=\cs

end

set fzf_fd_opts
set -a fzf_fd_opts --hidden # Considers hidden files (starting with dot i.e.)
set -a fzf_fd_opts --no-ignore # Considers files listed in git ignore

# Open searched entry in vim
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

