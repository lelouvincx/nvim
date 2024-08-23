return {
    {
        "Exafunction/codeium.vim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        cmd = "Codeium",
        build = ":Codeium Auth",
        commit = "289eb724e5d6fab2263e94a1ad6e54afebefafb2",
        event = "BufEnter",
        config = function()
            vim.keymap.set("i", "<C-Space>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true, silent = true })
        end,
    },
}
