return {
    -- Use dbt-language-server and sqlfmt
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "dbt-language-server", "sqlfmt" })
        end,
    },

    -- Configure LSP (dbtls) to work with blink
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                dbtls = {
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern("dbt_project.yml")(fname)
                    end,
                    settings = {
                        dbt = {
                            -- NOTE: disable standard completion here if necessary
                        },
                    },
                },
            },
        },
    },

    -- Ensure tree-sitter supports jinja
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "sql", "jinja", "jinja_inline" })
        end,
    },
}
