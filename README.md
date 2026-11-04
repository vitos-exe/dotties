# Dotties
Here you can find my dotties :)))

Managed with [mise](https://mise.jdx.dev/). This repo is the mise config directory itself, `~/.config/mise`.

- `config.toml` declares everything: which dotfiles get linked into `$HOME` (`[dotfiles]`), CLI tools (`[tools]`), and machine bootstrap steps (`[bootstrap.*]`: Homebrew formulae and casks, macOS preferences, login shell, shell activation, cloned repos like oh-my-zsh and pure).
- The dotfiles sit at the repo root under their real names (`.zshrc`, `.config/nvim`, `Library/Application Support/...`), because `settings.dotfiles.root` points here.
- Homebrew packages are listed in `[bootstrap.packages]` as `brew:` (formulae) and `brew-cask:` (casks). To pick up newly installed formulae, run `mise bootstrap packages import --global`. Casks have to be added by hand.

## Applying on a new machine

```
mise bootstrap --adopt vitos-exe/dotties
```
