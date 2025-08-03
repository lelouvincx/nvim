return {
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            flavour = "latte",
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.15,
            },
            transparent_background = false,
            default_integrations = true,
            integrations = {
                aerial = true,
                cmp = vim.g.cmp_enabled,
                blink_cmp = vim.g.blink_enabled,
                grug_far = true,
                headlines = true,
                mini = {
                    enabled = true,
                    indentscope_color = "lavender",
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                noice = true,
                snacks = false,
            },
        },
        specs = {
            {
                "akinsho/bufferline.nvim",
                optional = true,
                opts = function(_, opts)
                    if (vim.g.colors_name or ""):find("catppuccin") then
                        opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
                    end
                end,
            },
        },
    },
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
