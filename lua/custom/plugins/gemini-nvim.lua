return {
  'JunYang-tes/gemini-nvim',
  config = function()
    require('gemini-nvim').setup {
      -- The style of the window to open.
      -- Can be 'float' or 'side'.
      window_style = 'side',

      -- For `window_style = 'side'`.
      -- Can be 'left' or 'right'.
      side_position = 'right',

      -- For `window_style = 'float'`.
      -- Values are a percentage of the editor's dimensions.
      float_width_ratio = 0.8,
      float_height_ratio = 0.8,

      -- Whether to create the default keymap for toggling the window.
      set_default_keymap = true,

      -- The keymap to use for toggling the window.
      -- Changed from '<F3>' to '<leader>g'
      toggle_keymap = '<leader>g',
    }
  end,
}
