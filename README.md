# Dotties
Here you can find my dotties :)))

Managed with [mise](https://mise.jdx.dev/). This repo is the mise config directory itself, `~/.config/mise`.

- `config.toml` holds what every machine shares: dotfiles, CLI tools (`[tools]`), and bootstrap steps (login shell, mise shell activation, oh-my-zsh and pure repos).
- `config.macos.toml` adds the Mac-only parts: Homebrew formulae and casks, the AeroSpace, Ghostty and lazygit dotfiles, and a hook that installs Ruby before packages (mise needs it to read casks from third-party taps).
- `miserc.toml` sets `auto_env = true`, which makes mise load `config.macos.toml` automatically on a Mac (and `config.linux.toml` on Linux, if one is ever added).
- The dotfiles sit at the repo root under their real names (`.zshrc`, `.config/nvim`, `Library/Application Support/...`), because `settings.dotfiles.root` points here.
- To pick up newly installed Homebrew formulae, run `mise bootstrap packages import --path config.macos.toml`. Casks have to be added by hand.

## Applying on a new machine

```
mise bootstrap --adopt vitos-exe/dotties
```
