-- https://github.com/kdheepak/lazygit.nvim
-- <leader>g is already taken by Gemini's toggle (custom/plugins/gemini-nvim.lua),
-- so this lives under <leader>l instead rather than colliding under a 'g' prefix.
vim.pack.add {
  'https://github.com/kdheepak/lazygit.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
}

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<CR>', { desc = '[L]azy[g]it' })

local ok_wk, wk = pcall(require, 'which-key')
if ok_wk then wk.add { { '<leader>l', group = '[L]azygit' } } end
