# Dotties
Here you can find my dotties :)))

Managed with [mise](https://mise.jdx.dev/). This repo is the mise config directory itself, `~/.config/mise`.

- `config.toml` declares everything: which dotfiles get linked into `$HOME` (`[dotfiles]`), CLI tools (`[tools]`), and machine bootstrap steps (`[bootstrap.*]`: packages, login shell, shell activation, cloned repos like oh-my-zsh and pure).
- The dotfiles sit at the repo root under their real names (`.zshrc`, `.config/nvim`, `Library/Application Support/...`), because `settings.dotfiles.root` points here.
- `brew/Brewfile` isn't managed by mise. Run it by hand with `brew bundle --file=brew/Brewfile`.

## Applying on a new machine

```
git clone git@github.com:vitos-exe/dotfiles.git ~/.config/mise
mise bootstrap
```
