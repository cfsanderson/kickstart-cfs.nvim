vim.g.vimwiki_list = {
	{ path = '$HOME/Library/CloudStorage/Dropbox/.wiki', syntax = 'markdown', ext = '.md', links_space_char = '_' } }

vim.g.taskwiki_markup_syntax = 'markdown'
vim.g.markdown_folding = 1

-- makes vimwiki links as [text](text.md) instead of [text](text)
vim.g.vimwiki_markdown_link_ext = 1

-- auto add headers to new pages and diary entries
vim.g.vimwiki_auto_header = 1

return {
	"vimwiki/vimwiki",
}
