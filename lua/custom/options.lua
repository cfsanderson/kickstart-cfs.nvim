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
vim.o.autoindent = true
vim.o.smartindent = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- other settings
vim.o.swapfile = false

-- global options (previously vim.g.* by mistake - vim.g is for global
-- *variables*, not editor options, so these were silent no-ops)
vim.o.backup = true
vim.o.belloff = 'all'
vim.o.cmdheight = 2
vim.o.compatible = false
vim.o.errorbells = false
vim.o.guifont = 'monospace:h17'
vim.o.incsearch = true
vim.o.pumheight = 10
vim.o.showtabline = 2
vim.o.sidescrolloff = 5
local undodir = vim.fs.joinpath(vim.fn.stdpath 'state', 'undo')
vim.fn.mkdir(undodir, 'p')
vim.o.undodir = undodir
vim.o.writebackup = false

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
    vim.bo.smartindent = false
  end,
})

