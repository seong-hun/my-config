local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- Configure
  local conf = {
    profile = {enable = true, threshold = 0},
    display = {
      open_fn = function()
        return require('packer.util').float {border = "rounded"}
      end
    }
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" ..
                             "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
      }
      vim.cmd [[packadd packer.nvim]]
    end

    vim.cmd([[
			augroup packer_user_config
				autocmd!
				autocmd BufWritePost plugins.lua source <afile> | PackerCompile
			augroup end
		]])
  end

  -- Plugins
  local function plugins(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Startup
    use {
      'glepnir/dashboard-nvim',
      event = "VimEnter",
      config = function() require("config.dashboard").setup() end,
      requires = {"nvim-tree/nvim-web-devicons"}
    }

    -- Dressing for better UI
    use {'stevearc/dressing.nvim'}

    -- Floaterm
    use {
      'voldikss/vim-floaterm',
      config = function() require("config.floaterm").setup() end
    }

    -- LSP
    use {
      'neovim/nvim-lspconfig',
      config = function() require("config.lspconfig").setup() end
    }

    use {
      'nvimdev/lspsaga.nvim',
      config = function() require("config.lspsaga").setup() end
    }

    -- use({
    --   'ray-x/navigator.lua',
    --   config = function() require("navigator").setup() end,
    --   requires = {
    --     {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
    --     {'neovim/nvim-lspconfig'}
    --   }
    -- })

    use 'onsails/lspkind-nvim'

    -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-omni'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use {
      'hrsh7th/nvim-cmp',
      config = function() require("config.nvimcmp").setup() end
    }

    use {
      "danymat/neogen",
      config = function() require('config.neogen').setup() end,
      requires = "nvim-treesitter/nvim-treesitter"
      -- Uncomment next line if you want to follow only stable versions
      -- tag = "*"
    }

    -- Tpope
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-commentary'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-vinegar'

    -- Vimtex
    use 'lervag/vimtex'
    use 'Vimjas/vim-python-pep8-indent'

    -- Colorscheme
    -- use "ellisonleao/gruvbox.nvim"
    use 'folke/tokyonight.nvim'
    use 'sainnhe/sonokai'
    use 'EdenEast/nightfox.nvim'

    -- Utils
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require("config.treesitter").setup() end
    }
    use 'nvim-lua/popup.nvim'

    -- Load only when require
    use {"nvim-lua/plenary.nvim", module = "plenary"}

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup {default = true}
      end
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/plenary.nvim'}},
      config = function() require("config.telescope").setup() end
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- Git
    use {
      'lewis6991/gitsigns.nvim',
      config = function() require("config.gitsigns").setup() end
    }

    -- WhichKey
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function() require("config.whichkey").setup() end
    }

    -- Lualine
    use {
      "nvim-lualine/lualine.nvim",
      -- event = "VimEnter",
      requires = {"nvim-web-devicons"},
      config = function() require("config.lualine").setup() end
    }

    -- use {
    --   "SmiteshP/nvim-gps",
    --   requires = "nvim-treesitter/nvim-treesitter",
    --   module = "nvim-gps",
    --   config = function() require("nvim-gps").setup() end
    -- }

    -- Buffer line
    use {
      "akinsho/nvim-bufferline.lua",
      -- event = "BufReadPre",
      -- wants = "nvim-web-devicons",
      tag = "v3.*",
      requires = "nvim-web-devicons",
      config = function() require("config.bufferline").setup() end
    }

    use {
      "jeetsukumaran/vim-buffergator",
      config = function() require("config.buffergator").setup() end
    }

    -- Zen mode
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use {
      "Pocco81/TrueZen.nvim",
      config = function() require("config.truezen").setup() end
    }

    -- Quick note
    use {
      'weizheheng/nvim-workbench',
      config = function() require("config.workbench").setup() end
    }

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
      ft = {"markdown"}
    }

    -- Web
    use {
      "windwp/nvim-ts-autotag",
      config = function() require("nvim-ts-autotag").setup {} end
    }
  end

  packer_init()
  packer = require "packer"
  packer.init(conf)
  return packer.startup(plugins)
end

return M
