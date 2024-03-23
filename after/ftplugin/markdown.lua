vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.md' },
  -- group = group,
  command = 'setlocal wrap linebreak',
})
