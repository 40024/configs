-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Scroll fine-tuning (VSCode Shift+U / Shift+D)
map("n", "<S-u>", "<C-y>", opts)
map("n", "<S-d>", "<C-e>", opts)
