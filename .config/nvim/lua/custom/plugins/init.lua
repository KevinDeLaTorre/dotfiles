return {

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

  -- Rails
  ["tpope/vim-rails"] = {
    config = function()
      require "custom.plugins.vim-rails"
    end,
  },

  -- Quickfix
  ["kevinhwang91/nvim-bqf"] = {
    config = function()
      require "custom.plugins.nvim-bqf"
    end,
  },

  -- Context
  ["ahmedkhalf/lsp-rooter.nvim"] = {},

}
