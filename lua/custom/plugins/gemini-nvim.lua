if vim.g.machine_profile ~= 'work' then return end

vim.pack.add { 'https://github.com/JunYang-tes/gemini-nvim' }

require('gemini-nvim').setup {
  window_style = 'side',
  side_position = 'right',
  float_width_ratio = 0.8,
  float_height_ratio = 0.8,
  set_default_keymap = true,
  toggle_keymap = '<leader>g',
}
