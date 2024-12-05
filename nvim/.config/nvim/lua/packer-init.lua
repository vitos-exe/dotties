-- Automatically install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Use packer to manage plugins
return require('packer').startup(function(use)
  -- Packer can manage itself
  use {
    'wbthomason/packer.nvim'
  }

  use {
    'nvim-treesitter/nvim-treesitter'
  }


  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'neovim/nvim-lspconfig'
  }


  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',    -- Buffer completions
      'hrsh7th/cmp-path',      -- Path completions
      'hrsh7th/cmp-cmdline',   -- Cmdline completions
      'hrsh7th/cmp-vsnip',     -- Snippet completions
      'hrsh7th/vim-vsnip',     -- Snippet engine
      'hrsh7th/cmp-nvim-lua',  -- Neovim Lua API completions
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons', opt = true
    }
  }

  use {
    'lewis6991/gitsigns.nvim'
  }

  use {
    'catppuccin/nvim', as = 'catppuccin'
  }

  use {
    'tpope/vim-commentary'
  }

  use {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }

  use {
    'mfussenegger/nvim-jdtls'
  }

  use {
    'Mofiqul/vscode.nvim'
  }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

