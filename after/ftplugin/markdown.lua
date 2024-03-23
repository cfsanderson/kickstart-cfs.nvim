-- automatically set wrap and linebreak for all markdown files
-- https://www.reddit.com/r/neovim/comments/ujd7o1/only_set_wrap_for_specific_filetypes_with_lua/

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.md' },
  -- group = group,
  command = 'setlocal wrap linebreak',
})
