local overrides = require "custom.configs.overrides"

return {

  --------- Default Plugin Overrides -------

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
    -- config = function()
    --   require("telescope").load_extension("ui-select")
    -- end
  },

  -- {
  --   "nvim-telescope/telescope-ui-select.nvim", -- adds a ui for code actions
  -- },

  -------- custom.configs ----------

  -- Autocomplete
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "custom.configs.copilot"
    end,
  },

  -- Editor Config
  {
    "gpanders/editorconfig.nvim",
    config = function()
      require "custom.configs.editorconfig"
    end,
  },

  -- Format and Linting
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   after = "nvim-lspconfig",
  --   config = function()
  --     require "custom.configs.null-ls"
  --   end,
  -- },

  {
    "stevearc/conform.nvim",
    after = "nvim-lspconfig",
    config = function ()
      require "custom.configs.conform"
    end
  },

  {
    "tpope/vim-surround",
    config = function()
      require "custom.configs.vim-surround"
    end,
  },

  -- Indentation
  {
    "tpope/vim-sleuth",
    config = function()
      require "custom.configs.vim-sleuth"
    end,
  },

  -- Rails/Ruby
  {
    "tpope/vim-rails",
    config = function()
      require "custom.configs.vim-rails"
    end,
  },

  {
    "RRethy/nvim-treesitter-endwise", -- Adds ruby block completion
    config = function()
      require("nvim-treesitter.configs").setup {
        endwise = {
          enable = true,
        },
      }
    end,
  },

  -- Quickfix
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require "custom.configs.nvim-bqf"
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    config = function()
      require "custom.configs.project-nvim"
    end,
  },

  -- Folding
  {
    "anuvyklack/pretty-fold.nvim",
    requires = "anuvyklack/nvim-keymap-amend", -- only for preview
    config = function()
      require "custom.configs.pretty-fold"
    end,
  },

  {
    "anuvyklack/fold-preview.nvim",
    requires = "anuvyklack/nvim-keymap-amend", -- only for preview
    config = function()
      require("fold-preview").setup()
    end,
  },

  -- Buffers
  {
    "numToStr/BufOnly.nvim", -- Allows delete all but this buffer capability
  },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require "custom.configs.nvim-lastplace"
    end,
  }
}
