source ~/.config/fish/fisher-init.fish

for file in ~/.config/fish/custom/*
    source $file
end
