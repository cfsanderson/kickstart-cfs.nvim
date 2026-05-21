-- https://github.com/MeanderingProgrammer/render-markdown.nvim
vim.treesitter.language.register('markdown', 'vimwiki')

vim.pack.add { 'https://github.com/MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  file_types = { 'markdown', 'vimwiki' },
}
