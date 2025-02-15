return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            sql = { "sqlfluff" },
        },
        formatters = {
            sqlfluff = {
                command = "sqlfluff",
                args = { "format", "--dialect", "bigquery", "--processes", "4", "-" },
                stdin = true,
                condition = function()
                    return true
                end,
            },
        },
    },
    default_format_opts = {
        timeout_ms = 10000, -- 10 seconds
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
    },
    format_on_save = {
        timeout_ms = 10000, -- 10 seconds
        lsp_format = "fallback",
    },
}
