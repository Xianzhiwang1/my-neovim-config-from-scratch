vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local opts = {noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)
keymap("n", "<leader>w", ":bdelete<CR>", opts)
keymap("n", "<leader>s", ":w<CR>", opts)
