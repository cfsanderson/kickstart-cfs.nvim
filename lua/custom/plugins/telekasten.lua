return {
  'nvim-telekasten/telekasten.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    home = vim.fn.expand("~/Projects/wiki"), -- Your existing VimWiki directory
    dailies = vim.fn.expand("~/Projects/wiki/diary"), -- Your diary folder
    templates = vim.fn.expand("~/Projects/wiki/templates"), -- Templates (create if needed)
    extension = ".md",
    new_note_filename = "title",
    follow_creates_nonexisting = true,
    calendar_opts = {
      weekdayheader = true,
      calendar_monday = 1,
    },
  },
  keys = {
    { '<leader>z', '<cmd>Telekasten panel<cr>', desc = 'Open Telekasten panel' },
    { '<leader>zf', '<cmd>Telekasten find_notes<cr>', desc = 'Find notes' },
    { '<leader>zg', '<cmd>Telekasten search_notes<cr>', desc = 'Search notes' },
    { '<leader>zd', '<cmd>Telekasten goto_today<cr>', desc = 'Go to today' },
    { '<leader>zz', '<cmd>Telekasten follow_link<cr>', desc = 'Follow link' },
    { '<leader>zn', '<cmd>Telekasten new_note<cr>', desc = 'New note' },
    { '<leader>zc', '<cmd>Telekasten show_calendar<cr>', desc = 'Show calendar' },
    { '<leader>zb', '<cmd>Telekasten show_backlinks<cr>', desc = 'Show backlinks' },
    { '<leader>zI', '<cmd>Telekasten insert_img_link<cr>', desc = 'Insert image link' },
  },
}