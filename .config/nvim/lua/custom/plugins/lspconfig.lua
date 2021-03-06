local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config
  local servers = {
    "bashls",
    "cssls",
    "dockerls",
    "emmet_ls",
    "eslint",
    "html",
    "jsonls",
    "pyright",
    "solargraph",
    "sqlls",
    "yamlls"
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = function(client, bufnr)
        attach(client, bufnr)
      end,
      capabilities = capabilities,
      root_dir = vim.loop.cwd,
    }
  end

  -- temporarily disable tsserver suggestions
  require("lspconfig").solargraph.setup {
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },

    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,
  }
end

return M
