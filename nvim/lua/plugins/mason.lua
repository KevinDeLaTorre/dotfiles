-- add any tools you want to have installed below
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      -- "deno",
      "eslint-lsp",
      "emmet-language-server",
      "json-lsp",
      "rubocop",
      "yaml-language-server",
      "sqlls",
      "prettierd",
      "prettier",

      -- python
      "pyright",
      "black",
      "isort",

      -- shell
      "bash-language-server",
      "dockerfile-language-server",
      "shfmt",
    },

    automatic_installation = true,
  },
}
