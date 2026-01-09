vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.dbml",
    command = "setfiletype dbml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.env.*",
    command = "setfiletype sh",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.envrc.*",
    command = "setfiletype sh",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = ".zimrc",
    command = "setfiletype sh",
})
