-- https://github.com/iamcco/markdown-preview.nvim
-- NOTE: Requires `npm install` build step; see PackChanged autocmd in init.lua
vim.pack.add { 'https://github.com/iamcco/markdown-preview.nvim' }

-- Use Neovim's job system to open the URL so the browser launch doesn't depend
-- on the prebuilt binary's subprocess environment (which silently fails on macOS).
vim.cmd([[
  function! OpenMarkdownPreviewBrowser(url)
    call jobstart(['open', a:url])
  endfunction
]])
vim.g.mkdp_browserfunc = 'OpenMarkdownPreviewBrowser'

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_port = '8080'
vim.g.mkdp_echo_preview_url = 1
