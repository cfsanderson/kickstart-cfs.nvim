-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- Disable netrw entirely, per neo-tree's own README recommendation.
-- hijack_netrw_behavior below only redirects *some* netrw entry points;
-- leaving netrw's own ftplugin/autocmds loaded alongside it means netrw
-- can still win intermittently (e.g. opening a directory from the shell:
-- `nvim ~/dotfiles`), showing its own Size/date column listing instead of
-- neo-tree's tree view.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local plugins = {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

if vim.g.have_nerd_font then
  table.insert(plugins, 'https://github.com/nvim-tree/nvim-web-devicons') -- not strictly required, but recommended
end

vim.pack.add(plugins)

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  close_if_last_window = true,
  filesystem = {
    hijack_netrw_behavior = 'open_current',
    filtered_items = {
      -- visible=true shows filtered items (dotfiles, gitignored) by
      -- default while keeping them toggleable with H (toggle_hidden).
      -- hide_dotfiles=false instead would remove dotfiles from the
      -- filtered set entirely, leaving H nothing to toggle.
      visible = true,
      hide_gitignored = false,
      -- Default true: every descendant of a filtered (dotfile) folder
      -- inherits that folder's flat "hidden item" highlight too - e.g.
      -- everything under .config would render in one muted color
      -- regardless of its own type.
      children_inherit_highlights = false,
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
  default_component_configs = {
    -- Default true: filtered items (dotfiles) get a flat "hidden item"
    -- highlight (NeoTreeDotfile) instead of their real per-type color -
    -- e.g. .git rendering the same muted gray as everything else in it.
    icon = {
      use_filtered_colors = false,
      -- neo-tree's own default provider already calls nvim-web-devicons
      -- for files, but never for directories - devicons has no dedicated
      -- "directory" category the way mini.icons does, only a name-based
      -- lookup that happens to cover some well-known folder names (.git,
      -- node_modules, .config, etc). Use it when there's a match; fall
      -- back to the normal folder_open/folder_closed glyph otherwise.
      provider = function(icon, node)
        local ok, devicons = pcall(require, 'nvim-web-devicons')
        if not ok then return end
        if node.type == 'directory' then
          local text, hl = devicons.get_icon(node.name, nil, { default = false })
          if text then icon.text, icon.highlight = text, hl end
        elseif node.type == 'file' or node.type == 'terminal' then
          local name = node.type == 'terminal' and 'terminal' or node.name
          local text, hl = devicons.get_icon(name, nil, { default = true })
          icon.text, icon.highlight = text or icon.text, hl or icon.highlight
        end
      end,
    },
    name = { use_filtered_colors = false },
  },
}
