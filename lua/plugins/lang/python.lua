return {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
        servers = {
            -- pyright will be automatically installed with mason and loaded with lspconfig
            pyright = {
                settings = {
                    pyright = {
                        typeCheckingMode = "basic",
                        logLevel = "Warning",
                        diagnosticMode = "workspace",
                        autoSearchPaths = true,
                        autoImportCompletions = true,
                        useLibraryCodeForTypes = true,
                        -- INFO: Set true to disable this option, use ruff's organizeImports instead
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            ignore = { "*" },
                        },
                    },
                },
            },
            ruff = {
                cmd_env = { RUFF_TRACE = "messages" },
                init_options = {
                    settings = {
                        logLevel = "error",
                    },
                },
                keys = {
                    {
                        "<leader>co",
                        LazyVim.lsp.action["source.organizeImports"],
                        desc = "Organize Imports",
                    },
                },
            },
        },
        setup = {},
    },
}
