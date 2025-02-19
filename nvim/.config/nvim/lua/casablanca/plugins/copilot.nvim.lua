return {
	'github/copilot.vim',
	cond = function ()
		local restricted = '/Users/vitalii.chernysh/work'
		local cwd = vim.fn.getcwd()
		local not_restricted = cwd:find(restricted) == nil
		return not_restricted
	end
}

