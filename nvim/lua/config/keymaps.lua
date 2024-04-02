-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- key overrides
keymap.set({ "n" }, ";", ":", { desc = "Alias for colon to make command entry easy" })

-- Movement
keymap.set({ "n" }, "<leader>g", "gg <CR>", { desc = "Goes to given line" })

-- Fast Saving
keymap.set({ "n" }, "<leader>w", "<cmd> w! <CR>", { desc = "Force saves current file" })
keymap.set({ "n" }, "<leader>wa", "<cmd> wa! <CR>", { desc = "Force saves all files" })

-- Buffers
keymap.set({ "n" }, "<leader>bd", "<cmd> bdelete <CR>", { desc = "Deletes current buffer" })
keymap.set({ "n" }, "<leader>br", "<cmd> bufdo e <CR>", { desc = "Reloads all buffers" })
keymap.set({ "n" }, "<leader>ba", "<cmd> bufdo bd <CR>", { desc = "Closes all buffers" })
keymap.set({ "n" }, "<leader>bn", "<cmd> bnext <CR>", { desc = "Switch to next buffer" })
keymap.set({ "n" }, "<leader>bp", "<cmd> bprevious <CR>", { desc = "Switch to previous buffer" })
