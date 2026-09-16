local theme_name = 'kanagawa'

return {
	'rebelot/kanagawa.nvim',
	cond = function ()
		return os.getenv('NVIM_THEME') == theme_name
	end,
	config = function ()
		require('kanagawa').setup({
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none"
						}
					}
				}
			}
		})
		vim.cmd.colorscheme 'kanagawa'
	end
}
