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
                        -- INFO: Disable this option, use ruff's organizeImports instead
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
        setup = {
            -- NOTE: This is the old LSP implementation version
            -- ["ruff"] = function()
            --     local on_attach = function(client, bufnr)
            --         if client.name == "ruff" then
            --             -- INFO: Disable hover in favor of Pyright
            --             client.server_capabilities.hoverProvider = false
            --         end
            --     end
            --
            --     require("lspconfig").ruff.setup({
            --         on_attach = on_attach,
            --     })
            -- end,
        },
    },
}
