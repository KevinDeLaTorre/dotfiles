-- change some telescope options and a keymap to browse plugin files
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fr", false },
    { "<leader>o", "<cmd> :Telescope buffers <CR>", desc = "Show current buffers" },
    { "<leader>fo", "<cmd> :Telescope oldfiles<CR>", desc = "Show recent files" },
    { "<leader>ff", "<cmd> :Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fw", "<cmd> :Telescope live_grep<CR>", desc = "Live Grep" },
  },

  -- change some options
  opts = {
    defaults = {
      initial_mode = "normal",
      layout_config = {
        prompt_position = "top", -- Move search bar to top
      },
      sorting_strategy = "ascending", -- Show results at the top of result window instead of bottom
      mappings = {
        n = {
          -- Extra keybinds
          ["o"] = "select_default", -- Enables opening of files with 'o' in picker
        },
      },
    },

    pickers = {
      buffers = {
        sort_mru = true,
        sort_lastused = true,
        ignore_current_buffer = true,
      },

      oldfiles = {
        -- initial_mode = "insert",
        hidden = true,
      },

      find_files = {
        initial_mode = "insert",
        hidden = true,
      },

      live_grep = {
        initial_mode = "insert",
        hidden = true,
      },
    },
    extensions = {
    },
  },
}
