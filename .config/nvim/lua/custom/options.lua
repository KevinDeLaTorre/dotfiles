local opt = vim.opt
local g = vim.g
local wo = vim.wo
local cmd = vim.cmd

opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 72
