-- https://github.com/kdheepak/lazygit.nvim
vim.pack.add {
  'https://github.com/kdheepak/lazygit.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
}

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<CR>', { desc = '[L]azy[g]it' })

local ok_wk, wk = pcall(require, 'which-key')
if ok_wk then wk.add { { '<leader>l', group = '[L]azygit' } } end
