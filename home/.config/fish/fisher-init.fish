# Check if curl is available
if not command -q curl
    echo "Error: curl is not installed. Please install it first."
    exit 1
end

if not functions -q fisher; and test -z "$FISHER_BEING_INSTALLED" 
    set -x FISHER_BEING_INSTALLED 1
    echo "Fisher is not installed. Do you want to install it? (y/n)"
    read -l choice
    if test "$choice" = "y"
        echo "Installing Fisher..."
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
        echo "Fisher installed successfully."
    else
        echo "Installation canceled."
    end
end
