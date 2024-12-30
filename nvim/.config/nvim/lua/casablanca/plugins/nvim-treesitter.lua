return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = {'html', 'python', 'java', 'typescript'},
			highlight = { enable = true },
			indent = { enable = true }
		}
	end
}
