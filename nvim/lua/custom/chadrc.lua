local M = {}

-- local override = require("custom.override")

M.plugins = require "custom.plugins"

-- M.plugins = {
--   options = {
--     lspconfig = {
--       setup_lspconf = "custom.plugins.lspconfig",
--     },
--   },
--
--   override = {
--     user = require("custom.plugins"),
--     ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
--     ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
--     ["nvim-telescope/telescope.nvim"] = override.telescope,
--     ["hrsh7th/nvim-cmp"] = override.cmp,
--     ["williamboman/mason"] = override.mason,
--   },
--
--   user = require("custom.plugins"),
-- }

M.ui = {
  theme = "tokyonight",
  hl_add = require "custom.highlights",
}

-- M.options = {
--    user = function()
--        require("custom.options")
--    end,
-- }

M.mappings = require("custom.mappings")

return M
