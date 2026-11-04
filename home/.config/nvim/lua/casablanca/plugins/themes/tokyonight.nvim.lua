local theme_name = 'tokyonight'

return {
	"folke/tokyonight.nvim",
	cond = function ()
		return os.getenv('NVIM_THEME') == theme_name
	end,
	config = function ()
		vim.cmd.colorscheme 'tokyonight-day'
	end
}
