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
      sort_mru = true,
      sort_lastused = true,
      ignore_current_buffer = true,
    },

    oldfiles = {
      initial_mode = "insert",
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
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "eslint-lsp",
    "emmet-ls",
    "json-lsp",
    "solargraph",
    "yaml-language-server",
    "sqlls",

    -- python
    "pyright",
    "pylint",
    "black",
    "isort",

    -- shell
    "shfmt",
    "bash-language-server",
    "shellcheck",
    "dockerfile-language-server",
  },
}

return M
