return {
    { "EdenEast/nightfox.nvim" },
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            flavour = "mocha",
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = true,
            default_integrations = true,
            integrations = {
                aerial = true,
                alpha = true,
                cmp = true,
                dashboard = true,
                flash = true,
                grug_far = true,
                gitsigns = true,
                headlines = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                leap = true,
                lsp_trouble = true,
                mason = true,
                markdown = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                neotree = true,
                noice = true,
                notify = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
                snacks = false,
                blink_cmp = false, -- TODO: change this to true to enable blink.cmp
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
