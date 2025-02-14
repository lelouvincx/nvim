-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

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

-- Enable AI
vim.g.ai_suggestion = true
vim.g.ai_cmp = true

-- Enable LSP Signature
vim.g.lsp_signature = true

-- Enable remote
vim.g.remote = false

-- Use telescope as the default picker
vim.g.lazyvim_picker = "telescope"

-- Use blink
vim.g.lazyvim_blink_main = false
