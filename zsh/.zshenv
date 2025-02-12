# Custom directory for Oh My Zsh custom files.
export ZSH_CUSTOM=~/.oh-my-zsh-custom

# Makes tmux start at zsh startup.
export ZSH_TMUX_AUTOSTART=false

# The java home directory location. May vary!
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home"

# Disables Ryuk for Testcontainers. May be needed for Colima.
export TESTCONTAINERS_RYUK_DISABLED=true

# Node added to the path.
export PATH="/usr/local/opt/node@22/bin:$PATH"

# The editor to use.
export EDITOR=nvim

# No extra info from brew
export HOMEBREW_NO_ENV_HINTS=

# uv tool binaries added to the path
export PATH="/Users/vitalii.chernysh/.local/bin:$PATH"

# Disable light colors for difftastic
export DFT_BACKGROUND=light

# Make difftastic display whole file during diff
export DFT_CONTEXT=20

