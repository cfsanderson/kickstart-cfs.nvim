vim.pack.add {
  'https://github.com/VonHeikemen/fine-cmdline.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<CR>', '<cmd>FineCmdline<CR>', { noremap = true })
