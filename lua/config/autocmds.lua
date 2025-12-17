-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for specific filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "javascript", "typescript" },
    callback = function()
        vim.b.autoformat = false
    end,
})

-- Change Copilot ghost text color (Example: subtle blue-gray)
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = "#6272a4", italic = true })
vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#6272a4", italic = true })
