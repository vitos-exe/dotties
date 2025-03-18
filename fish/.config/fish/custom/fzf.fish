#fzf.fish extra config
if type -q fzf_configure_bindings
    fzf_configure_bindings --directory=\cf --git_status=\cs

end
set fzf_fd_opts --hidden --no-ignore --color=never

