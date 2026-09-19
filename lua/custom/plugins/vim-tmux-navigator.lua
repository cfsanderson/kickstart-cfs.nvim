vim.pack.add { 'https://github.com/christoomey/vim-tmux-navigator' }

-- Without this, navigating "off the edge" of the tmux layout from inside
-- nvim (e.g. pressing <C-h> while nvim's pane is already the leftmost pane)
-- calls tmux's `select-pane -L`, which wraps around to the pane on the
-- *opposite* side of the layout by default - looks exactly like the pane
-- randomly "swapping" to somewhere unrelated. Confirmed by direct testing
-- in an isolated tmux session. This makes it a no-op at the edge instead.
vim.g.tmux_navigator_no_wrap = 1
