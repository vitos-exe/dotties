# Java home directory
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home"

# Default editor
set -x EDITOR nvim

# Turn off Homebrew hints
set -x HOMEBREW_NO_ENV_HINTS 1

# Disable light colors for difftastic
set -x DFT_BACKGROUND light

# Globally disable Ryuk for Testcontainers
set -x TESTCONTAINERS_RYUK_DISABLED true

# Theme for Neovim
set -x NVIM_THEME "catppuccin-latte"

if type -q vivid
	set -x LS_COLORS $(vivid generate ayu)
end

