#fzf.fish extra config
fzf_configure_bindings --directory=\cf --git_status=\cs
set fzf_fd_opts --hidden --no-ignore

if status is-interactive
    # Commands to run in interactive sessions can go here
end
