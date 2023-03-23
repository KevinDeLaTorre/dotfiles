local overrides = require "custom.plugins.overrides"

return {

  --------- Default Plugin Overrides -------

  -- File explorer
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
    -- config = function()
    --   require("telescope").load_extension("ui-select")
    -- end
  },

  -- ["nvim-telescope/telescope-ui-select.nvim"] = {}, -- adds a ui for code actions

  -------- Custom Plugins ----------

  -- Editor Config
  ["gpanders/editorconfig.nvim"] = {
    config = function()
      require "custom.plugins.editorconfig"
    end,
  },

  -- Format and Linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["tpope/vim-surround"] = {
    config = function()
      require "custom.plugins.vim-surround"
    end,
  },

  -- Indentation
  ["tpope/vim-sleuth"] = {
    config = function()
      require "custom.plugins.vim-sleuth"
    end,
  },

  -- Rails/Ruby
  ["tpope/vim-rails"] = {
    config = function()
      require "custom.plugins.vim-rails"
    end,
  },

  ["RRethy/nvim-treesitter-endwise"] = { -- Adds ruby block completion
    config = function()
      require("nvim-treesitter.configs").setup {
        endwise = {
          enable = true,
        },
      }
    end,
  },

  -- Quickfix
  ["kevinhwang91/nvim-bqf"] = {
    config = function()
      require "custom.plugins.nvim-bqf"
    end,
  },

  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require "custom.plugins.project-nvim"
    end,
  },

  -- Folding
  ["anuvyklack/pretty-fold.nvim"] = {
    requires = "anuvyklack/nvim-keymap-amend", -- only for preview
    config = function()
      require "custom.plugins.pretty-fold"
    end,
  },

  ["anuvyklack/fold-preview.nvim"] = {
    requires = "anuvyklack/nvim-keymap-amend", -- only for preview
    config = function()
      require("fold-preview").setup()
    end,
  },

  -- Buffers
  ["numToStr/BufOnly.nvim"] = {}, -- Allows delete all but this buffer capability
  ["ethanholz/nvim-lastplace"] = {
    config = function()
      require "custom.plugins.nvim-lastplace"
    end,
  },
}
