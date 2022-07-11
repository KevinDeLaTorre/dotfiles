-- overriding default lua plugin configs
local M = {}

M.treesitter = {
   ensure_installed = {
      "vim",
      "html",
      "css",
      "javascript",
      "json",
      "toml",
      "markdown",
      "bash",
      "lua",
      "ruby",
      "python",
   },
}

M.nvimtree = {
  auto_reload_on_write = true,

  -- Refreshes the tree every time you focus a different file, so if changing
  -- to a different project and using lsp-rooter it'll reference that project instead
  update_focused_file = {
    update_cwd = true,
  },

   git = {
      enable = true,
   },

   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },

   view = {
     side = "right", -- Moves nvimtree to the right side
   },

   actions = {
     open_file = {
       quit_on_open = true, -- Closes nvimtree when opening a file
     },
   },
}

M.telescope = {
  defaults = {
    initial_mode = "normal",
    mappings = {
      n = {
        -- Extra keybinds
        ["o"] = "select_default", -- Enables opening of files with 'o' in picker
      },
    },
  },

  pickers = {
    buffers = {
      sort_lastused = true,
    },

    find_files = {
      initial_mode = "insert",
    },

    live_grep = {
      initial_mode = "insert",
    }
  },
}

M.cmp = {

}

return M
