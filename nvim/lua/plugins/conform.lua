vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    { "<leader>l", false },
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "LSP format entire file",
    },
  },

  opts = {
    formatters_by_ft = {
      -- Conform will run multiple formatters sequentially

      -- Lua
      lua = { "stylua" },

      -- Python
      python = { "isort", "black" },

      -- Webdev
      javascript = { { "prettierd", "prettier" } },

      json = { "fixjson" },

      -- Ruby
      ruby = { "rubocop" },

      -- Shell
      sh = { "shfmt" },

      haml = { "haml-lint"}
    },
    formatters = {
      rubocop = {
        args = { "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
      },
    },
  },

  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
