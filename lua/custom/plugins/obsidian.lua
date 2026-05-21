-- https://github.com/epwalsh/obsidian.nvim
vim.pack.add {
  'https://github.com/epwalsh/obsidian.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
}

-- Load only when opening vault files to avoid slow startup
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  pattern = vim.fn.expand '$HOME' .. '/Projects/second-brain/*.md',
  once = true,
  callback = function()
    require('obsidian').setup {
      ui = { enable = false },
      workspaces = {
        {
          name = 'second-brain',
          path = '/Users/caleb/Projects/second-brain',
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
  end,
})
