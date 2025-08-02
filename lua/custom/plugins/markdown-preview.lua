-- https://github.com/iamcco/markdown-preview.nvim
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  init = function()
    -- Set Zen browser as the default browser for markdown preview
    vim.g.mkdp_browser = '/usr/bin/zen-browser'

    -- Auto-start when opening markdown file
    vim.g.mkdp_auto_start = 0

    -- Auto-close when leaving markdown buffer
    vim.g.mkdp_auto_close = 1

    -- Refresh only when saving or leaving insert mode
    vim.g.mkdp_refresh_slow = 0

    -- Port for the preview server
    vim.g.mkdp_port = '8080'

    -- Echo preview page URL in command line
    vim.g.mkdp_echo_preview_url = 1
  end,
}
