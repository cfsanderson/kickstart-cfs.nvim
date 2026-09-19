-- https://github.com/akinsho/bufferline.nvim
-- Shows open buffers as tabs across the top, carried over from the Omarchy
-- LazyVim setup.
vim.pack.add {
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('bufferline').setup {
  options = {
    mode = 'buffers',
    diagnostics = 'nvim_lsp',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = 'thin',
  },
}

local keymap = vim.keymap.set
keymap('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer', silent = true })
keymap('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer', silent = true })
keymap('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { desc = '[B]uffer [P]ick' })
keymap('n', '<leader>bc', '<cmd>bdelete<CR>', { desc = '[B]uffer [C]lose' })
