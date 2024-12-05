-- List of modules to import
local modules = {
	'packer-config',
	'treesitter-config',
	'telescope-config',
	'cmp-config',
	'lsp-config',
	'lualine-config',
	'gitsigns-config',
	'settings'
}

-- Loop through the list and require each module
for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    vim.notify("Error loading module " .. module .. ": " .. err, vim.log.levels.ERROR)
  end
end
