source ~/.config/fish/fisher-init.fish

for file in ~/.config/fish/custom/*
    source $file
end

set -g fish_key_bindings fish_vi_key_bindings

