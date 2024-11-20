return {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {
        popup_window = {
            enter = true,
            focusable = true,
            zindex = 20,
            position = "50%",
            relative = "win",
            size = {
                width = "90%",
                height = "90%",
            },
            buf_options = {
                modifiable = true,
                readonly = false,
            },
            win_options = {
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                winblend = 0,
            },
            border = {
                highlight = "FloatBorder",
                style = "rounded",
                text = {
                    top = " Lazy Docker ",
                },
            },
        },
    }, -- automatically calls `require("lazydocker").setup()`
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}
