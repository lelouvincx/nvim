return {
    "folke/noice.nvim",
    optional = true,
    opts = function(_, opts)
        vim.list_extend(opts.routes, {
            {
                filter = {
                    event = "msg_show",
                    any = {
                        { find = "Supermaven" },
                    },
                },
                skip = false,
            },
            {
                filter = {
                    event = "notify",
                    find = "method textDocument/documentHighlight is not supported",
                },
                skip = true,
            },
        })
    end,
}
