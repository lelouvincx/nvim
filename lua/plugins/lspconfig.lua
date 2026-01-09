return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "SmiteshP/nvim-navbuddy", -- Provides breakcrumbs for better navigation
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
    },
    opts = function()
        -- Add the border on hover and on signature help popup window
        local handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
        }

        -- Add border to the diagnostic popup window
        vim.diagnostic.config({
            virtual_text = {
                prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
            },
            float = { border = "rounded", focusable = true },
        })

        local lspconfig = require("lspconfig")
        -- INFO: Add the handlers to all the servers
        -- Need to add more when needed
        local servers = { "lua_ls", "pyright", "ruff" }

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({ handlers = handlers })
        end
    end,
}
