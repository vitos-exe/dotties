# Dotties
Here you can find my dotties :)))

Managed with [chezmoi](https://www.chezmoi.io/). This repo lives at `~/.local/share/chezmoi`, chezmoi's default source directory, so `chezmoi diff` and `chezmoi apply` work with no extra flags.

The `home/` directory holds the managed tree (mirrors `$HOME`, dot-prefixed paths use chezmoi's `dot_` naming convention). `brew/Brewfile` stays outside the managed tree and is invoked manually with `brew bundle --file=brew/Brewfile`.

## Applying on a new machine

```
chezmoi init --apply git@github.com:vitos-exe/dotties.git
```

