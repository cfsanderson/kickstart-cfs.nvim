vim.g.vimwiki_list = {
  {
    path = '$HOME/Projects/wiki',
    path_html = 'wiki_html_location',
    syntax = 'markdown',
    ext = '.md',
    links_space_char = '_',
    custom_wiki2html = '~/Projects/wiki/wiki2html.sh',
    -- html_filename_parameterization = 1
    -- https://gist.github.com/enpassant/0496e3db19e32e110edca03647c36541
  },
}

vim.g.taskwiki_markup_syntax = 'markdown'
vim.g.markdown_folding = 1

-- makes vimwiki links as [text](text.md) instead of [text](text)
vim.g.vimwiki_markdown_link_ext = 1

-- auto add headers to new pages and diary entries
vim.g.vimwiki_auto_header = 1

return {
  'vimwiki/vimwiki',
}
