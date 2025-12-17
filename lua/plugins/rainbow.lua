-- lua/plugins/rainbow.lua
return {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        local rainbow_delimiters = require("rainbow-delimiters")

        ---@type rainbow_delimiters.config
        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy.global,
            },
            query = {
                [""] = "rainbow-delimiters",
            },
            priority = {
                [""] = 110,
            },
            highlight = {
                "RainbowDelimiterGreen",
                "RainbowDelimiterYellow",
                "RainbowDelimiterRed",
                "RainbowDelimiterBlue",
                "RainbowDelimiterViolet",
                "RainbowDelimiterOrange",
                "RainbowDelimiterCyan",
            },
        }
    end,
}
