-------------------------------------
-- Options
-------------------------------------
-- Most options are set in main init.lua, here are some extras
-- See `:help vim.o`
-- See also https://vimdoc.sourceforge.net/htmldoc/options.html#'incsearch'

-- options
vim.o.timeout = true
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.relativenumber = true

-- window-local options
vim.wo.conceallevel = 0
vim.wo.numberwidth = 4
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

-- buffer-local options
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.fileencoding = 'utf-8'
vim.bo.smartindent = true
vim.bo.softtabstop = 2
vim.bo.swapfile = false
vim.bo.syntax = 'ON'

-- global options
vim.g.backup = true
vim.g.belloff = 'all'
vim.g.cmdheight = 2
vim.g.compatible = false
vim.g.errorbells = false
vim.g.guifont = 'monospace:h17'
vim.g.incsearch = true
vim.g.pumheight = 10
vim.g.showtabline = 2
vim.g.sidescrolloff = 5
vim.g.undodir = '~/.vim/undodir'
vim.g.writebackup = false
