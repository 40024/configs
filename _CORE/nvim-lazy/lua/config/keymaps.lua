-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-k>", ":bprevious<CR>", opts)

-- New buffer (Ctrl+T)
map("n", "<C-t>", ":enew<CR>", opts)

-- Move between splits (like VSCode Ctrl+W then direction)
map("n", "<C-w>h", "<C-w>h", opts)
map("n", "<C-w>j", "<C-w>j", opts)
map("n", "<C-w>k", "<C-w>k", opts)
map("n", "<C-w>l", "<C-w>l", opts)
