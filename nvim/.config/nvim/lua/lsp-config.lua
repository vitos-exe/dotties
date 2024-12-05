-- Import the lspconfig plugin
local lspconfig = require('lspconfig')



-- Function to set up key mappings when the LSP server attaches to the buffer
local on_attach = function(_, bufnr)
  -- Helper function to simplify setting keybindings
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  -- LSP keybindings
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())



-- Customize the hover window border
vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single"  -- or you can use "rounded", "double", "shadow", etc.
})

-- Set a black border color for the hover window
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#000000', bg = 'None' })  -- Black border



lspconfig.jsonls.setup{ on_attach = on_attach, capabilities = capabilities}
lspconfig.ts_ls.setup{ on_attach = on_attach, capabilities = capabilities}
lspconfig.pyright.setup{ on_attach = on_attach, capabilities = capabilities}
lspconfig.angularls.setup{ on_attach = on_attach, capabilities = capabilities}
lspconfig.cssls.setup{ on_attach = on_attach, capabilities = capabilities}
lspconfig.html.setup{ on_attach = on_attach, capabilities = capabilities}
lspconfig.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

