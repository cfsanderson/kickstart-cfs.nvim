return {
  'cfsanderson/cfs-gruvbox-material',
  priority = 10000,
  lazy = false,
  config = function()
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_foreground = 'material'
    vim.g.gruvbox_material_background = 'hard'
    vim.cmd.colorscheme 'gruvbox-material'
  end,
}
