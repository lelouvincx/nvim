vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = ".zimrc",
    command = "setfiletype sh",
})
