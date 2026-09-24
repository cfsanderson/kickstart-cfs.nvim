-- https://github.com/epwalsh/obsidian.nvim
vim.pack.add {
  'https://github.com/epwalsh/obsidian.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
}

require('obsidian').setup {
  ui = { enable = false },
  workspaces = {
    {
      name = 'second-brain',
      path = vim.fn.expand '~/Projects/second-brain',
    },
  },
  mapping = {
    ['<leader>fl'] = {
      action = function()
        return require('obsidian').util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },
  templates = {
    subdir = 'Templates',
    date_format = '%Y-%m-%d-%a',
    time_format = '%H:%M',
    tags = '',
  },
}
