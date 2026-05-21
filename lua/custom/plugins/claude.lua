-- Claude Code Integration — no plugin needed, just keymaps and user commands

local function open_claude_terminal()
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error == 0 then
    vim.cmd('cd ' .. git_root)
  end
  vim.cmd 'vsplit'
  vim.cmd 'terminal claude'
  vim.cmd 'startinsert'
end

local function send_file_to_claude()
  local filename = vim.fn.expand '%:.'
  local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
  local claude_prompt = string.format("Here's my file `%s`:\n\n```%s\n%s\n```\n\n", filename, vim.bo.filetype, content)
  vim.fn.setreg('+', claude_prompt)
  print 'File content copied to clipboard for Claude!'
end

local function send_selection_to_claude()
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
  if #lines > 0 then
    local selection = table.concat(lines, '\n')
    local prompt = string.format("Here's some code I'd like help with:\n\n```%s\n%s\n```\n\n", vim.bo.filetype, selection)
    vim.fn.setreg('+', prompt)
    print 'Selection copied to clipboard for Claude!'
  end
end

local function send_buffer_for_debug()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local numbered_lines = {}
  for i, line in ipairs(lines) do
    table.insert(numbered_lines, string.format('%3d: %s', i, line))
  end
  local filename = vim.fn.expand '%:.'
  local content = table.concat(numbered_lines, '\n')
  local prompt = string.format(
    "I'm having an issue with this file `%s`. Here it is with line numbers:\n\n```%s\n%s\n```\n\nThe issue is: ",
    filename,
    vim.bo.filetype,
    content
  )
  vim.fn.setreg('+', prompt)
  print 'File with line numbers copied to clipboard for Claude!'
end

vim.api.nvim_create_user_command('Claude', open_claude_terminal, { desc = 'Open Claude Code terminal' })
vim.api.nvim_create_user_command('ClaudeFile', send_file_to_claude, { desc = 'Copy current file to clipboard for Claude' })
vim.api.nvim_create_user_command('ClaudeDebug', send_buffer_for_debug, { desc = 'Copy file with line numbers for debugging' })

vim.keymap.set('n', '<leader>cc', open_claude_terminal, { desc = '[C]laude [C]ode terminal' })
vim.keymap.set('n', '<leader>cf', send_file_to_claude, { desc = '[C]laude [F]ile copy' })
vim.keymap.set('n', '<leader>cd', send_buffer_for_debug, { desc = '[C]laude [D]ebug copy' })
vim.keymap.set('v', '<leader>cs', send_selection_to_claude, { desc = '[C]laude [S]election copy' })

local ok, wk = pcall(require, 'which-key')
if ok then
  wk.add { { '<leader>c', group = '[C]laude Integration' } }
end
