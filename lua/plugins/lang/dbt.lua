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

    {
        "PedramNavid/dbtpal",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        ft = { "sql", "yaml", "md" },
        keys = {
            { "<leader>mr", "<cmd>DbtRun<cr>", desc = "Run Current Model" },
            { "<leader>mt", "<cmd>DbtTest<cr>", desc = "Test Current Model" },
            { "<leader>ma", "<cmd>lua require('dbtpal').run_all()<cr>", desc = "Run All Models" },
            { "<leader>md", "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
        },
        config = function()
            require("dbtpal").setup({
                path_to_dbt = "dbt",
                path_to_dbt_project = "",
                path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
                extended_path_search = true,
                protect_compiled_files = true,
            })
            require("telescope").load_extension("dbtpal")
        end,
    },

    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                {
                    "<leader>m",
                    group = "dbt",
                    icon = "🛢️",
                },
            },
        },
    },
}
