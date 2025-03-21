set paths "$HOME/.local/bin" "/usr/local/opt/node@22/bin"
for p in $paths
    if test -d $p
        fish_add_path $p
    end
end
