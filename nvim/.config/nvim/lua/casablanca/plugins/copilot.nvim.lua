return {
	'github/copilot.vim',
	init = function()
		vim.g.copilot_enabled = false
		vim.g.copilot_no_tab_map = true
	end,
	config = function()
		vim.keymap.set('i', '<C-l>', 'copilot#Accept("<CR>")', {
			expr = true,
			replace_keycodes = false,
			silent = true
		})
	end,
	cond = function()
		local restricted = '/Users/vitalii.chernysh/work'
		local cwd = vim.fn.getcwd()
		--- How do i parse getenv into boolean value
		local not_restricted = cwd:find(restricted) == nil or os.getenv('FORCE_ALLOW_COPILOT') == 'true'
		return not_restricted
	end
}
