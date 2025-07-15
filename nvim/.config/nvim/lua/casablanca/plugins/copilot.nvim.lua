return {
	'github/copilot.vim',
	init = function()
		vim.g.copilot_enabled = true
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
		local not_restricted = cwd:find(restricted) ~= nil
		return not_restricted
	end
}
