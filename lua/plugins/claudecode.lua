return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    version = false, -- Never set this value to "*"! Never!
    enabled = (vim.g.ai_chat == "claudecode"),
    keys = {
        { "<leader>a", nil, desc = "AI/Claude Code" },
        { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
        { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
        { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
        { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
        { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
        {
            "<leader>as",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Add file",
            ft = { "NvimTree", "neo-tree", "oil" },
        },
        -- Diff management
        { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
        { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
    opts = {
        -- Server Configuration
        port_range = { min = 10000, max = 65535 }, -- random port for websocket server to connect to claude cli
        auto_start = true,
        log_level = "info", -- "trace", "debug", "info", "warn", "error"
        terminal_cmd = nil, -- Custom terminal command (default: "claude")

        -- Selection Tracking
        track_selection = true,
        visual_demotion_delay_ms = 50,

        -- Terminal Configuration
        terminal = {
            split_side = "right", -- "left" or "right"
            split_width_percentage = 0.30,
            provider = "auto", -- "auto", "snacks", or "native"
            auto_close = true,
        },

        -- Diff Integration
        diff_opts = {
            auto_close_on_accept = true,
            vertical_split = true,
            open_in_current_tab = true,
        },
    },
}
