local theme_name = 'catppuccin-latte'

return {
	'catppuccin/nvim',
	name = "catppuccin",
	cond = function ()
		return os.getenv('NVIM_THEME') == theme_name
	end,
	config = function ()
		vim.cmd.colorscheme 'catppuccin-latte'
	end
}
