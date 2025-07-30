# GEMINI.md

This file provides guidance to Gemini when working with code in this repository.

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
Uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager:
- Plugins are defined in the main `require('lazy').setup()` call in init.lua
- Custom plugins are automatically loaded from `lua/custom/plugins/`
- Each plugin file should return a table with plugin specification

### Key Components
- **LSP**: Configured via nvim-lspconfig with Mason for automatic installation
- **Completion**: nvim-cmp with LuaSnip for snippets
- **Fuzzy Finding**: Telescope with fzf-native integration
- **Treesitter**: Syntax highlighting and parsing
- **Git Integration**: Gitsigns for git status in editor
- **File Explorer**: Neo-tree (optional kickstart module)

## Common Development Tasks

### Plugin Management
- **View installed plugins**: `:Lazy`
- **Update plugins**: `:Lazy update`
- **Install new plugin**: Add to lazy.setup() or create file in `lua/custom/plugins/`

### LSP Operations
- **View LSP status**: `:LspInfo`
- **Install language servers**: `:Mason`
- **Restart LSP**: `:LspRestart`

### Configuration Management
- **Check health**: `:checkhealth`
- **Reload config**: Restart Neovim (no hot reload by design)
- **View options**: `:help options`

### Debugging Configuration
- **View loaded plugins**: `:Lazy`
- **Check LSP attachment**: `:LspInfo`
- **View treesitter info**: `:TSInstallInfo`
- **Inspect element**: `<leader>ti` (inspect under cursor)

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

## Dependencies and Requirements

### External Tools
- **git**: Version control
- **make**: Building telescope-fzf-native
- **gcc**: C compiler for native extensions
- **ripgrep**: Fast text search (rg command)
- **fd**: Fast file finder
- **unzip**: Archive extraction
- **Nerd Font**: For icons (optional, controlled by `vim.g.have_nerd_font`)

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
