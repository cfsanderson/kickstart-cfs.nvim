vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }

-- Set up on first InsertEnter to avoid slowing startup
vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<M-l>',
          accept_word = '<M-w>',
          accept_line = '<M-j>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = false,
      },
    }
  end,
})
