-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
require('custom.options')
require('custom.keymaps')

-- Load machine-local config if present (gitignored).
-- Create ~/.config/nvim/local.lua on each machine to set vim.g.machine_profile.
-- Example contents:  vim.g.machine_profile = 'work'
-- Defaults to 'personal' if the file doesn't exist.
vim.g.machine_profile = 'personal'
pcall(dofile, vim.fn.stdpath 'config' .. '/local.lua')

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir) do
  if type == 'file' and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end
