require("conform").setup({
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
})
