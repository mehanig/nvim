-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine')
	end
  })

  use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

  use {
	    'VonHeikemen/lsp-zero.nvim',
	    branch = 'v1.x',
	    requires = {
		    -- LSP Support
		    {'neovim/nvim-lspconfig'},
		    {'williamboman/mason.nvim'},
		    {'williamboman/mason-lspconfig.nvim'},

		    -- Autocompletion
		    {'hrsh7th/nvim-cmp'},
		    {'hrsh7th/cmp-buffer'},
		    {'hrsh7th/cmp-path'},
		    {'saadparwaiz1/cmp_luasnip'},
		    {'hrsh7th/cmp-nvim-lsp'},
		    {'hrsh7th/cmp-nvim-lua'},

		    -- Snippets
		    {'L3MON4D3/LuaSnip'},
		    {'rafamadriz/friendly-snippets'},
	    }
    }

      use("github/copilot.vim")
      use("theprimeagen/harpoon")

      use("mbbill/undotree")
      use("tpope/vim-fugitive")

      use('neovim/nvim-lspconfig')
      use('jose-elias-alvarez/null-ls.nvim')
      use('MunifTanjim/prettier.nvim')

      use('freddiehaddad/feline.nvim')
      use('lewis6991/gitsigns.nvim')
end)
