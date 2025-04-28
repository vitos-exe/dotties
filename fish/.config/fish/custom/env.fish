# Sets variables from git-ignored .env file
set -l filepath $HOME/.config/fish/.env
for line in (grep -v '^\s*#' $filepath)
	if test -z $line
	    continue
	end
	# split into key and rest-of-line as value
	set -l parts (string split -m1 "=" -- $line)
	set -l key   $parts[1]
	set -l value $parts[2]
	set -x $key $value
end


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

