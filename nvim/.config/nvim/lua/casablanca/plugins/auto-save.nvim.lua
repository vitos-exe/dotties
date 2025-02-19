return {
	'pocco81/auto-save.nvim',
	opts = {
		write_all_buffers = true
	},
	config = function ()
		vim.keymap.set("n", "<leader>n", ":ASToggle<CR>", {})
	end
}
