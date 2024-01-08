local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
    -- lua stuff
    "lua_ls",

    -- web dev
    "cssls",
    "html",
    "eslint",
    "emmet_ls",
    "jsonls",
    "solargraph",
    "yamlls",
    "sqlls",

    -- python
    "pyright",

    -- shell
    "bashls",
    "dockerls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
