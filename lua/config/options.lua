-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set line number and relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable unused language providers to speed up startup time
vim.g.loaded_python3_provider = 1
vim.g.loaded_python_provider = 1
vim.g.loaded_node_provider = 1
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

-- Send ESC to the terminal to keep it from exiting
vim.g.alt_send_esc = true

-- Use blink as auto completion engine
vim.g.blink_enabled = true

-- Enable AI
-- shoule be one of copilot
vim.g.copilot_suggestion = true
vim.g.ai_cmp = false -- set to false to enable blink's ghost text
vim.g.ai_chat = "claudecode" -- avante or claudecode
vim.g.copilot_lualine = true

-- Enable LSP Signature
vim.g.lsp_signature = true

-- Enable remote
vim.g.remote = false

-- Use telescope as the default picker
vim.g.lazyvim_picker = "telescope"

-- Expand claude config dir
vim.env.CLAUDE_CONFIG_DIR = vim.fn.expand("~/.config/claude")
