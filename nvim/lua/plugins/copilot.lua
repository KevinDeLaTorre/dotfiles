return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  keys = {
    { "<leader>cp", "<cmd> :CopilotChatToggle <CR>", desc = "Toggles Copilot Chat" },
  },
  opts = {
    debug = false, -- Enable debugging
    -- model = 'claude-3.5-sonnet'
    -- See Configuration section for rest
  },
  -- See Commands section for default commands if you want to lazy load on them
}
