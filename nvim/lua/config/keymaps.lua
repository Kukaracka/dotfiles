-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>s", "<cmd>:ToggleTerm direction=float<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>n", "<cmd>ASToggle<CR>", {})
vim.keymap.set("n", "<C-q>", "<cmd>bdelete<CR>")
