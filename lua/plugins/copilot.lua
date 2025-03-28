return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    enabled = vim.g.ai_suggestion,
    opts = {
        suggestion = {
            enabled = vim.g.ai_suggestion,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            keymap = {
                accept = false, -- handled by nvim-cmp / blink.cmp
                accept_line = false, -- handled by nvim-cmp / blink.cmp
                accept_word = "<C-l>", -- accept the current word
                next = "<C-j>",
                prev = false, -- not neccessary
                dismiss = "<C-x>",
            },
        },
        panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>",
            },
            layout = {
                position = "bottom", -- | top | left | right
                ratio = 0.4,
            },
        },
        auto_refresh = false,
        filetypes = {
            -- true
            python = true,
            javascript = true,
            typescript = true,
            java = true,
            markdown = true,
            yaml = true,
            json = true,
            lua = true,
            sql = true,
            -- false
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false, -- all files without an extension
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        workspace_folders = {},
        copilot_model = "gpt-4o-copilot", -- new completion model
        should_attach = function(_, _)
            if not vim.bo.buflisted then
                print("not attaching, buffer is not 'buflisted'")
                return false
            end

            if vim.bo.buftype ~= "" then
                print("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
                return false
            end

            return true
        end,
    },
}
