local M = {}

-- Disable keybindings from core
M.disable = {
  n = {
    ["<leader>e"] = "",
    ["<leader>n"] = "",
  },
}

M.general = {
  i = {

  },

  n = {
    -- Key overrides
    [";"] = { ":", "Overrides colon with semicolon to easily use commands"},

    -- Movement
    ["<leader>g"] = { "gg <CR>", "Goes to given line"},

    -- Fast Saving
    ["<leader>w"] = { "<cmd> w! <CR>", "Force saves current file"},
    ["<leader>wa"] = { "<cmd> wa! <CR>", "Force saves all files"},

    -- Buffers
    ["<leader>bd"] = { "<cmd> bdelete <CR>", "Deletes current buffer" },
    ["<leader>ba"] = { "<cmd> bufdo bd <CR>", "Closes all buffers" },
    ["<leader>br"] = { "<cmd> bufdo e <CR>", "Reloads all buffers" },
    ["<leader>bn"] = { "<cmd> bnext <CR>", "Switch to next buffer" },
    ["<leader>bp"] = { "<cmd> bprevious <CR>", "Switch to previous buffer" },
  }
}

M.nvimtree = {
  n = {
    ["<leader>nn"] = { "<cmd> NvimTreeToggle <CR>", "Toggles Nvimtree"}
  },
}

M.telescope = {
  n = {
    ["<leader>o"] = { "<cmd> :Telescope buffers <CR>", "Opens a buffer explorer" },
  },
}

M.null_ls = {
  n = {
    -- Disable the default floating diagnostic
    ["<leader>f"] = { "", "prefix" }
  }
}

return M
