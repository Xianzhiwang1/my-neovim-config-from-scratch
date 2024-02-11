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
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"


vim.opt.timeoutlen = 500

-- texconceal
vim.opt.conceallevel = 2
vim.g.tex_conceal = "abdmg"
vim.api.nvim_set_hl(0, "Conceal", { ctermfg = nil, guitermbg = nil })

-- vimtex options
vim.g.vimtex_compiler_method = "latexmk"
vim.g.tex_flavor = "latex"
-- vim.g.vimtex_view_method = "preview"
-- vim.g.vimtex_view_method = "zathura"
-- vim.g.vimtex_view_method = "mupdf"
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_indent_on_ampersands = 0
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_compiler_latexmk = {
  build_dir = "./build",
  callback = 1,
  continuous = 1,
  executable = "latexmk",
  options = {
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
    "-output-directory=build",
  },
}

