# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build/Lint/Test Commands

- Format Lua code: `stylua .` (uses `stylua.toml` config)
- Check Lua syntax: `luacheck lua/` (if available)
- Test config: `:checkhealth` in Neovim
- Reload config: `:Lazy reload` or restart Neovim
- Update plugins: `:Lazy update`
- Profile startup: `:Lazy profile`

## Architecture Overview

This is a **LazyVim-based Neovim configuration** with extensive customizations for modern development workflows.

### Core Architecture

- **Foundation**: LazyVim framework with lazy.nvim plugin manager
- **Initialization**: `init.lua` → `lua/config/lazy.lua` → plugin loading
- **Feature Flags**: Global variables control plugin loading (`vim.g.ai_chat`, `vim.g.blink_enabled`)
- **Colorscheme**: Catppuccin Mocha with transparency support

### Configuration Structure

- **Core Config**: `lua/config/` (options, keymaps, autocmds, lazy setup)
- **Plugin Specs**: `lua/plugins/` (30+ custom plugin configurations)
- **LSP Config**: `lua/lsp/` (language server configurations)
- **Filetype**: `after/ftplugin/` (per-filetype customizations)

### Plugin Organization

- **AI Integration**: `avante.lua`, `claudecode.lua`, `copilot.lua`, `neocodeium.lua`
- **Completion**: `blink.lua` (preferred), `nvim-cmp.lua` (fallback)
- **Development**: `treesitter.lua`, `gitsigns.lua`, `lazydocker.lua`, `project.lua`
- **UI/UX**: `colorscheme.lua`, `lualine.lua`, `neo-tree.lua`, `noice.lua`

### LazyVim Extras Integration

Key extras loaded via `lua/config/lazy.lua`:

- **AI**: `lazyvim.plugins.extras.ai.copilot-chat`
- **Languages**: `lazyvim.plugins.extras.lang.python`, `lazyvim.plugins.extras.lang.typescript`
- **UI**: `lazyvim.plugins.extras.ui.mini-animate`, `lazyvim.plugins.extras.ui.treesitter-context`
- **Tools**: `lazyvim.plugins.extras.util.project`, `lazyvim.plugins.extras.dap.core`

## Development Patterns

### AI-First Development

- **Primary Completion**: Neocodeium (enabled) with Blink.cmp integration
- **Chat Interface**: Claude Code integration (`vim.g.ai_chat = "claudecode"`)
- **Fallback**: Copilot available but disabled by default
- **Feature Flags**: `vim.g.ai_chat`, `vim.g.neocodeium_suggestion`, `vim.g.copilot_suggestion`

### Completion Strategy

- **Primary**: Blink.cmp (Rust-based, performant) with `vim.g.blink_enabled = true`
- **Sources**: LSP, AI (Neocodeium), buffer, path, ripgrep
- **Fallback**: nvim-cmp disabled by default (`vim.g.cmp_enabled = false`)

### LSP Configuration

- **Python**: Pyright (type checking) + Ruff (linting/formatting)
- **UI**: Rounded borders, enhanced diagnostics, signature help
- **Integration**: Mason for LSP installation, none-ls for formatting

### Plugin Loading Patterns

- **Lazy Loading**: Most plugins use `event = "VeryLazy"` or specific triggers
- **Conditional**: Feature flags prevent loading unused functionality
- **Dependencies**: Complex dependency chains managed via lazy.nvim specs

## Code Style Guidelines

- **Lua**: 4 spaces indentation, 120 character line limit (enforced by stylua)
- **Plugin Specs**: Follow lazy.nvim conventions, use `opts` table for configuration
- **Keymaps**: Minimal custom keymaps, prefer LazyVim defaults
- **Feature Flags**: Use global variables for conditional plugin loading
- **Comments**: Minimal, focus on configuration rationale

## Key Customizations

- **Tmux Integration**: Custom navigation keymaps (`<C-hjkl>`)
- **File Explorer**: Neo-tree with custom reveal keymap (`\`)
- **Project Management**: Project.nvim with telescope integration
- **Git Workflow**: Gitsigns + LazyGit integration
- **Docker**: LazyDocker integration (`<leader>k`)
- **Transparency**: Background transparency support across UI components

## Development Workflow

- **Primary Languages**: Python, TypeScript/JavaScript, Lua, SQL
- **Development Focus**: Data engineering, LLM applications, full-stack development
- **Testing**: Neotest integration for multiple test frameworks
- **Debugging**: DAP (Debug Adapter Protocol) support
- **Project Root**: Automatic detection via Project.nvim patterns