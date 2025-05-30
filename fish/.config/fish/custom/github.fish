# This function allows you to search for a GitHub repository using fzf and clone it.
function search_and_clone_repo
	gh repo list -q ".[].name" --json name | fzf | xargs gh repo clone
end

