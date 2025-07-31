-------------------------------------------------------------------------------
-- Keymaps --
-------------------------------------------------------------------------------

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-------------------------------------------------------------------------------
-- Normal --
-------------------------------------------------------------------------------
-- Better window navigation using Vim Tmux Navigator (../custom/plugins/vim-tmux-navigator.lua)
keymap('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', opts)
keymap('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', opts)
keymap('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', opts)
keymap('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', opts)
