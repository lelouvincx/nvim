vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.envrc.*",
    command = "setfiletype sh",
})
