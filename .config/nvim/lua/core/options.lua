
-- █▀▀ █░░ █▀█ █▄▄ ▄▀█ █░░   █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
-- █▄█ █▄▄ █▄█ █▄█ █▀█ █▄▄   ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.foldmethod = "marker"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.cmd("colorscheme catppuccin")
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.g.mapleader = " "
