return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = {'html', 'python', 'java', 'typescript', 'markdown', 'markdown_inline'},
			highlight = { enable = true },
			indent = { enable = true }
		}
	end
}
