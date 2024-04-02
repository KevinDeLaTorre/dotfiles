return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>l", false },
    {
      "<leader>lf",
      "<cmd>lua require('conform').format({async = true, lsp_fallback = true,timeout_ms = 500})<CR>",
      desc = "LSP format entire file",
    },
  },
  opts = {
    formatters = {
      -- Conform will run multiple formatters sequentially

      -- Lua
      lua = { "stylua" },

      -- Python
      python = { "isort", "black" },

      -- Webdev
      javascript = { { "prettierd", "prettier" } },

      -- Ruby
      ruby = { "rubocop" },

      -- Shell
      sh = { "shfmt" },
    },
  },
}
