return {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      {
        "<leader>nn",
        "<cmd> NvimTreeToggle <CR>",
        desc = "Toggles NvimTree",
      },
    },

    opts = {
      auto_reload_on_write = true,

      -- Config for project.nvim, which changes cwd to projects root when changing to different projects in same session
      respect_buf_cwd = true,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      git = {
        enable = true,
        ignore = false,
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
        adaptive_size = true,
      },

      actions = {
        open_file = {
          quit_on_open = true, -- Closes nvimtree when opening a file
          window_picker = {
            enable = false,
          },
        },
      },

      filters = {
        dotfiles = false,
      },
    },
  },
}
