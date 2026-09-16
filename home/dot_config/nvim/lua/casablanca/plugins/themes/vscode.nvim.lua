local theme_name = 'vscode'

return {
	'Mofiqul/vscode.nvim',
	cond = function ()
		return os.getenv('NVIM_THEME') == theme_name
	end,
	config = function ()
		vim.cmd.colorscheme 'vscode'
	end
}

