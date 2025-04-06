return {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    enabled = vim.g.supermaven_suggestion,
    dependencies = { "saghen/blink.compat" },
    cmd = {
        "SupermavenUseFree",
        "SupermavenUsePro",
    },
    opts = {
        keymaps = {
            accept_suggestion = "<Tab>",
            clear_suggestion = "<C-x",
            accept_word = "<C-l>", -- accept the current word
        },
        -- ignore_filetypes = { cpp = true }, -- or { "cpp", }
        color = {
            suggestion_color = "#ffffff",
            cterm = 244,
        },
        log_level = "info", -- set to "off" to disable logging completely
        disable_inline_completion = not vim.g.ai_cmp,
        disable_keymaps = false, -- disables built in keymaps for more manual control, default to false
        ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
        condition = function()
            print(" Supermaven is attached ")
            return false
        end,
    },
}
