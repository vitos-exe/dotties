local theme_name = 'gruvbox-material'

return {
	"sainnhe/gruvbox-material",
	cond = function ()
		return os.getenv('NVIM_THEME') == theme_name
	end,
	config = function()
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_background = "light"
		vim.cmd("colorscheme gruvbox-material")
	end,
}
