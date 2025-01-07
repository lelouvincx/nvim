vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.dbml",
    command = "setfiletype dbml",
})
