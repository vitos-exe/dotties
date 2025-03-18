return {
  "sainnhe/gruvbox-material",
  priority = 1000, -- ensures it loads early
  config = function()
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_background = "light"
		vim.cmd("colorscheme gruvbox-material")
  end,
}

