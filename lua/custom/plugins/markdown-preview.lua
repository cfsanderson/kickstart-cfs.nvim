-- https://github.com/iamcco/markdown-preview.nvim
-- NOTE: After first install, run :call mkdp#util#install() to build the plugin
vim.pack.add { 'https://github.com/iamcco/markdown-preview.nvim' }

vim.g.mkdp_browser = '/usr/bin/zen-browser'
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_port = '8080'
vim.g.mkdp_echo_preview_url = 1
