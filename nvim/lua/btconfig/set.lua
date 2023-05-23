--this file is the conglomorate of all of the various 'set commands that execute on startup

--line numbering
vim.opt.nu = true --give me line numbers
vim.opt.relativenumber = true --give me relative line numbers

--tab spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.expandtab = true

--hand off undoing to undotree and don't keep a swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.undodir = os.getenv("HOME") .. "/.vim.undodir"
vim.opt.undofile = true

--set incremental search. This helps immensely with tricky searches
vim.opt.hlsearch = false
vim.opt.incsearch = true

--I like good colors
vim.opt.termguicolors = true

--set scrolling so you don't reach the end of a file
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--fast update time
vim.opt.updatetime = 50

--color columns
--vim.opt.colorcolumn = "100"

--a better place to move my leader key moved from remap.lua
vim.g.mapleader = " "
