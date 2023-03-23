local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
    -- -- lua stuff
    -- "lua-language-server",
    -- "stylua",
    --
    -- -- web dev
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",
    -- "eslint-lsp",
    -- "emmet-ls",
    -- "json-lsp",
    -- "solargraph",
    -- "yaml-language-server",
    -- "sqlls",
    --
    -- -- python
    -- "pyright",
    --
    -- -- shell
    -- "shfmt",
    -- "bash-language-server",
    -- "shellcheck",
    -- "dockerfile-language-server",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
