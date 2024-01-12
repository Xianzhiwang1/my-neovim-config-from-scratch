-- from theprimeagen
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- no wrap text
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- for undotree
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
-- for incremental search
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- reserve 8 line of space when you scroll
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- leader key
vim.g.mapleader = " "



