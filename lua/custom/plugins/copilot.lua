if vim.g.machine_profile ~= 'work' then return end

vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }

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
