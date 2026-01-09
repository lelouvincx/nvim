return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- LazyVim merges this into its lspconfig setup
            diagnostics = {
                virtual_text = { prefix = "■ " },
                float = { border = "rounded", focusable = true },
            },
            -- Apply to all servers via LazyVim's setup
            servers = {
                lua_ls = {},
                pyright = {},
                ruff = {},
            },
        },
        init = function()
            -- Global LSP UI customizations
            local border = "rounded"
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
        end,
    },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
        opts = { lsp = { auto_attach = true } },
    },
}
