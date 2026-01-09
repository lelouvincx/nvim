return {
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        commit = "ce8d176faa4643e026e597ae3c31db59b63cef09",
        opts = {
            flavour = "latte",
            background = {
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
                bufferline = true,
                aerial = true,
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
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
