return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    enabled = vim.g.lsp_signature,
    opts = {},
    config = function(_, opts)
        require("lsp_signature").setup(opts)
    end,
}
