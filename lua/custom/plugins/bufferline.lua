-- https://github.com/akinsho/bufferline.nvim
-- Shows open buffers as tabs across the top, carried over from the Omarchy
-- LazyVim setup.
vim.pack.add {
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('bufferline').setup {
  options = {
    mode = 'buffers',
    diagnostics = 'nvim_lsp',
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = 'thin',
  },
}

local keymap = vim.keymap.set
keymap('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer', silent = true })
keymap('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer', silent = true })
keymap('n', '<leader>bp', '<cmd>BufferLinePick<CR>', { desc = '[B]uffer [P]ick' })

-- Close the current buffer but keep the window. Plain :bdelete closes every
-- window showing the buffer, which with neo-tree open leaves neo-tree as the
-- last window (close_if_last_window) and quits nvim. So switch each window to
-- another buffer first.
local function close_buffer()
  local buf = vim.api.nvim_get_current_buf()
  if vim.bo[buf].modified then
    local choice = vim.fn.confirm('Buffer has unsaved changes. Discard?', '&Yes\n&No', 2)
    if choice ~= 1 then return end
  end
  -- Pick a replacement: alternate buffer if listed, else the next listed one.
  local alt = vim.fn.bufnr '#'
  if alt == buf or alt < 1 or not vim.bo[alt].buflisted then
    alt = nil
    for _, b in ipairs(vim.api.nvim_list_bufs()) do
      if b ~= buf and vim.bo[b].buflisted then
        alt = b
        break
      end
    end
  end
  for _, win in ipairs(vim.fn.win_findbuf(buf)) do
    if alt then
      vim.api.nvim_win_set_buf(win, alt)
    else
      vim.api.nvim_win_call(win, function() vim.cmd 'enew' end)
    end
  end
  pcall(vim.api.nvim_buf_delete, buf, { force = true })
end

keymap('n', '<leader>bc', close_buffer, { desc = '[B]uffer [C]lose' })
