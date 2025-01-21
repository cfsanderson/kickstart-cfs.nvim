return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    'BufReadPre $HOME/Projects/second-brain/*.md',
    'BufNewFile $HOME/Projects/second-brain/*.md',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require('obsidian').setup {
      ui = { enable = false },
      workspaces = {
        {
          name = 'second-brain',
          path = '/Users/caleb/Projects/second-brain',
        },
      },
      -- completion = {
      --   nvim_cmp = true,
      --   -- Trigger completion at 2 chars
      --   min_chars = 2,
      --   new_notes_location = 'current_dir',
      --   -- 1. Wheter to add the note ID during completion.
      --   -- e.g. "[[Foo]]" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
      --   prepend_note_id = true,
      -- },
      mapping = {
        -- "Obsidian [f]ollow [l]ink"
        ['<leader>fl'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- could add toggle for check boxes with leader od
      },
      -- note_frontmatter_func = function(note)
      --   -- This is equivalent to the default frontmatter function.
      --   local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = '', project = '' }
      --   -- 'note.metadata' contains any manyally added fields in the frontmatter.
      --   -- So here we just make sure those fields are kept in the frontmatter.
      --   if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      --     for k, v in pairs(note.metadata) do
      --       out[k] = v
      --     end
      --   end
      --   return out
      -- end,

      templates = {
        subdir = 'Templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
        tags = '',
      },
    }
  end,
}
