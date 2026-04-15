# Java home directory
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"

# Default editor
set -x EDITOR nvim

# Turn off Homebrew hints
set -x HOMEBREW_NO_ENV_HINTS 1

# Disable light colors for difftastic
set -x DFT_BACKGROUND light

# Globally disable Ryuk for Testcontainers
set -x TESTCONTAINERS_RYUK_DISABLED true

# Theme for Neovim
set -x NVIM_THEME kanagawa

# Bat theme
set -x BAT_THEME gruvbox-dark

# Ollama config 
set -x OLLAMA_CONTEXT_LENGTH $(math 2^17)
set -x OLLAMA_KEEP_ALIVE 6h
