-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- TODO:
-- - [ ] close_if_last_window = true,

return {
  'nvim-neo-tree/neo-tree.nvim',
  ft = 'netrw', -- load when netrw opens to replace it
  cmd = 'Neotree', -- load when calling keymaps
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  init = function()
    -- make keymaps here to load them before the plugin itself
    -- they need to be in VimScript to not load the plugin prematurely
    -- they also need to begin with something specified in `cmd`
    -- (for this plugin, :Neotree has all of them i think?)
  end,
  config = function()
    require('neo-tree').setup {
      filesystem = {
        hijack_netrw_behavior = 'open_current',
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    }
    if vim.bo.filetype == 'netrw' and vim.b.netrw_method == nil then
      vim.defer_fn(function()
        vim.cmd('enew | Neotree current dir=' .. vim.b.netrw_curdir)
      end, 0)
    end
  end,
}
