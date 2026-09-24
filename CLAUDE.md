# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim, a minimal starter configuration designed to be:
- Small and focused
- Single-file based (init.lua) with modular extensions
- Completely documented and readable
- A starting point for customization, not a distribution

The configuration emphasizes learning and understanding over convenience, with extensive comments explaining every component.

## Architecture

### Core Structure
- **init.lua**: Main configuration file containing all core settings, plugins, and keymaps
- **lua/custom/**: User customizations and additional plugins
- **lua/kickstart/**: Optional kickstart modules that can be enabled
- **after/ftplugin/**: Filetype-specific configurations

### Plugin Management
Uses Neovim's built-in `vim.pack` (see `:help vim.pack`), not lazy.nvim:
- Core plugins are added via `vim.pack.add{...}` calls directly in init.lua
- Custom plugins live in `lua/custom/plugins/*.lua` - each file calls
  `vim.pack.add{...}` itself and does its own setup/keymaps immediately
  after (no `return {spec}` table, no lazy-loading)
- `lua/custom/plugins/init.lua` loads `custom.options`/`custom.keymaps`,
  then requires every other file in that directory
- Installed plugins live under `~/.local/share/nvim/site/pack/core/opt/`
  (outside this config dir entirely, so nothing to gitignore for it);
  `nvim-pack-lock.json` pins exact commits and IS tracked in this fork
  (see its own comment)

### Key Components
- **LSP**: Configured via nvim-lspconfig with Mason for automatic installation
- **Completion**: blink.cmp with LuaSnip for snippets
- **Fuzzy Finding**: Telescope with fzf-native integration
- **Treesitter**: Syntax highlighting and parsing
- **Git Integration**: Gitsigns for git status in editor; lazygit.nvim (`<leader>lg`) for a full git TUI
- **File Explorer**: Neo-tree (optional kickstart module)
- **Buffer Line**: bufferline.nvim shows open buffers as tabs across the top (`<S-h>`/`<S-l>` to cycle, `<leader>bp` to pick, `<leader>bc` to close)
- **AI Integration**: Claude Code plugin (`:Claude`, `<leader>cc`)

### Plugin Branch Notes (Neovim 0.12+)
These branches are required for Neovim 0.12 compatibility — do not change without testing:
- **nvim-treesitter**: `main` branch (v2 rewrite) — the old `master` branch is archived and incompatible with 0.12
- **telescope.nvim**: `master` branch — the `0.1.x` branch uses old nvim-treesitter APIs (`ft_to_lang`) removed in 0.12

### Fixing Plugin Compatibility After a kickstart.nvim Merge
If plugins break after merging upstream kickstart changes on Neovim 0.12:
1. Check the error traceback for the plugin and the API being called
2. Check if the plugin has a newer branch/version that uses native `vim.treesitter.*` APIs
3. Manually `git checkout` the correct branch in `~/.local/share/nvim/site/pack/core/opt/<plugin>/`,
   or repin via the `version =` field of that plugin's `vim.pack.add{...}` spec
4. Run `:lua vim.pack.update()` (or delete `nvim-pack-lock.json` and reopen nvim)
   so the lockfile reflects the change, then commit it
5. For nvim-treesitter specifically: run `:TSUpdate` after switching to rebuild parsers

## Common Development Tasks

### Plugin Management
- **View installed plugins**: `:lua vim.print(vim.pack.get())`
- **Update plugins**: `:lua vim.pack.update()` (or a specific plugin: `vim.pack.update({'name'})`)
- **Install new plugin**: create a file in `lua/custom/plugins/` that calls `vim.pack.add{...}`

### LSP Operations
- **View LSP status**: `:LspInfo`
- **Install language servers**: `:Mason`
- **Restart LSP**: `:LspRestart`

### Configuration Management
- **Check health**: `:checkhealth`
- **Reload config**: Restart Neovim (no hot reload by design)
- **View options**: `:help options`

### Debugging Configuration
- **View loaded plugins**: `:lua vim.print(vim.pack.get())`
- **Check LSP attachment**: `:LspInfo`
- **View treesitter info**: `:TSInstallInfo`
- **Inspect element**: `<leader>ti` (inspect under cursor)

### AI Integration Commands
- **Open Claude terminal**: `:Claude` or `<leader>cc`
- **Copy file for Claude**: `:ClaudeFile` or `<leader>cf`
- **Copy file with line numbers**: `:ClaudeDebug` or `<leader>cd`
- **Copy selection for Claude**: `<leader>cs` (visual mode)

## Customization Patterns

### Adding Custom Plugins
Create a new file in `lua/custom/plugins/` that returns a plugin spec:
```lua
return {
  'plugin/name',
  config = function()
    -- Plugin configuration
  end,
}
```

### Modifying Keymaps
- Core keymaps are in init.lua
- Additional keymaps can be added to `lua/custom/keymaps.lua`
- Use `vim.keymap.set()` for new mappings

### Adding Language Support
1. Language server will auto-install via Mason when detected
2. Add to `servers` table in init.lua for custom configuration
3. Add formatter to `formatters_by_ft` in conform.nvim config

### Theme Customization
- Current theme: gruvbox-material (custom fork)
- Theme config in `lua/custom/plugins/gruvbox-material.lua`
- Statusline theme in `lua/custom/plugins/lualine.lua`

### Navigation and Window Management
- **Tmux-style navigation**: `<C-h/j/k/l>` for seamless pane switching (requires vim-tmux-navigator)
- **Core telescope keymaps**: `<leader>sf` (files), `<leader>sg` (grep), `<leader>sh` (help), `<leader><leader>` (buffers)

## Dependencies and Requirements

### External Tools
- **git**: Version control
- **make**: Building telescope-fzf-native
- **gcc**: C compiler for native extensions
- **ripgrep**: Fast text search (rg command)
- **fd**: Fast file finder
- **unzip**: Archive extraction
- **Nerd Font**: For icons (optional, controlled by `vim.g.have_nerd_font`)
- **tree-sitter-cli**: Required by nvim-treesitter v2 (main branch) to compile parsers — install via `npm install -g tree-sitter-cli` (NOTE: `brew install tree-sitter` only installs the C library, not the CLI)

### Language-specific
- **Node.js/npm**: For TypeScript/JavaScript development
- **Python**: For Python language server
- **Go**: For Go development
- **Rust**: For Rust development

## Configuration Philosophy

This configuration follows kickstart.nvim principles:
- Prioritize understanding over convenience
- Keep configuration readable and documented
- Provide a foundation for learning, not a complete IDE
- Encourage users to read and modify the configuration
- Avoid overwhelming new users with too many features

When modifying this configuration, maintain the educational approach and document any significant changes.