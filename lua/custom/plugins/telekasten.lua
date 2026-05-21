vim.pack.add {
  'https://github.com/nvim-telekasten/telekasten.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
}

require('telekasten').setup {
  home = vim.fn.expand '~/Projects/wiki',
  dailies = vim.fn.expand '~/Projects/wiki/diary',
  templates = vim.fn.expand '~/Projects/wiki/templates',
  extension = '.md',
  new_note_filename = 'title',
  follow_creates_nonexisting = true,
  calendar_opts = {
    weekdayheader = true,
    calendar_monday = 1,
  },
}

vim.keymap.set('n', '<leader>z', '<cmd>Telekasten panel<cr>', { desc = 'Open Telekasten panel' })
vim.keymap.set('n', '<leader>zf', '<cmd>Telekasten find_notes<cr>', { desc = 'Find notes' })
vim.keymap.set('n', '<leader>zg', '<cmd>Telekasten search_notes<cr>', { desc = 'Search notes' })
vim.keymap.set('n', '<leader>zd', '<cmd>Telekasten goto_today<cr>', { desc = 'Go to today' })
vim.keymap.set('n', '<leader>zz', '<cmd>Telekasten follow_link<cr>', { desc = 'Follow link' })
vim.keymap.set('n', '<leader>zn', '<cmd>Telekasten new_note<cr>', { desc = 'New note' })
vim.keymap.set('n', '<leader>zc', '<cmd>Telekasten show_calendar<cr>', { desc = 'Show calendar' })
vim.keymap.set('n', '<leader>zb', '<cmd>Telekasten show_backlinks<cr>', { desc = 'Show backlinks' })
vim.keymap.set('n', '<leader>zI', '<cmd>Telekasten insert_img_link<cr>', { desc = 'Insert image link' })
