-------------------------------------------------------------------------------
-- Keymaps --
-------------------------------------------------------------------------------

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- relative numbers in netrw
-- vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

-- set <leader>e to open netrw
-- vim.keymap.set('n', '<leader>e', ':E<cr>', { silent = false })

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-------------------------------------------------------------------------------
-- Normal --
-------------------------------------------------------------------------------
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Clear highlights
keymap('n', '<leader>h', '<cmd>nohlsearch<CR>', opts)

-- Close buffers
keymap('n', '<S-q>', '<cmd>Bdelete!<CR>', opts)

-- Better paste
keymap('v', 'p', '"_dP', opts)

-- use F2 to insert current date in 'Day DD Mon YYYY' format
-- keymap("n", "<F2>", 'i<C-R>=strftime("%a %d %b %Y")<CR><ESC>', opts)

-- use F3 to insert current time
-- keymap("n", "<F3>", 'i<C-R>=strftime("%H:%M:%S")<CR><ESC>', opts)

-------------------------------------------------------------------------------
-- Insert --
-------------------------------------------------------------------------------

-- use F2 to insert current date in 'Day DD Mon YYYY' format
keymap('i', '<F2>', '<C-R>=strftime("%a %d %b %Y")<CR>', opts)

-- use F3 to insert current time
keymap('i', '<F3>', '<C-R>=strftime("%H:%M:%S")<CR>', opts)

-------------------------------------------------------------------------------
-- Visual --
-------------------------------------------------------------------------------

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-------------------------------------------------------------------------------
-- Plugins --
-------------------------------------------------------------------------------

-- NvimTree
keymap('n', '<leader>n', ':NvimTreeToggle<CR>', opts)

-- ZenMode and MarkdownPreview
keymap('n', '<leader>z', ':ZenMode | MarkdownPreview <CR>', opts)

-- Git
keymap('n', '<leader>gg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', opts)

-- Comment
keymap('n', '<leader>/', "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap('x', '<leader>/', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap('n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>", opts)
keymap('n', '<leader>di', "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap('n', '<leader>do', "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap('n', '<leader>dO', "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap('n', '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap('n', '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap('n', '<leader>du', "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap('n', '<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", opts)
