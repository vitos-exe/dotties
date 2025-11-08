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
set -x NVIM_THEME gruvbox-material

# Setting colors for LS using vivid color generator
if type -q vivid
	set -x LS_COLORS $(vivid generate ayu)
end

# Bat theme
set -x BAT_THEME gruvbox-light

# Gemini config
set -x GEMINI_MODEL gemini-2.5-flash

# Ollama config 
set -x OLLAMA_CONTEXT_LENGTH $(math 2^17)
set -x OLLAMA_KEEP_ALIVE 6h
