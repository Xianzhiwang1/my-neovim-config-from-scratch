local opts = {noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- <C-e> stands for Control + E

keymap("n", "<M-k>", ':MarkdownPreview<CR>', opts)
keymap("n", "<M-s>", ':MarkdownPreviewStop<CR>', opts)
