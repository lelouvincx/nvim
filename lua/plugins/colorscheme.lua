local mode_file = vim.fn.expand("~/.cache/system-theme/mode")

local function read_flavour()
    if not vim.uv.fs_stat(mode_file) then
        return nil
    end
    local ok, lines = pcall(vim.fn.readfile, mode_file, "", 1)
    if ok and (lines[1] == "latte" or lines[1] == "mocha") then
        return lines[1]
    end
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = function(_, opts)
            opts.flavour = read_flavour() or opts.flavour or "mocha"
        end,
        config = function(_, opts)
            require("catppuccin").setup(opts)

            local current_flavour = opts.flavour
            local cache_dir = vim.fs.dirname(mode_file)
            vim.fn.mkdir(cache_dir, "p")

            if vim.system_theme_watcher and not vim.system_theme_watcher:is_closing() then
                vim.system_theme_watcher:stop()
                vim.system_theme_watcher:close()
            end

            local watcher = vim.uv.new_fs_event()
            local function apply_flavour()
                local next_flavour = read_flavour()
                if not next_flavour or next_flavour == current_flavour then
                    return
                end
                current_flavour = next_flavour
                vim.cmd.colorscheme("catppuccin-" .. next_flavour)
            end

            local ok, result, start_error = pcall(watcher.start, watcher, cache_dir, {}, function(error, filename)
                if error or (filename and vim.fs.basename(filename) ~= "mode") then
                    return
                end
                vim.schedule(apply_flavour)
            end)
            if not ok or not result then
                watcher:close()
                vim.schedule(function()
                    vim.notify("System theme watcher failed: " .. tostring(start_error or result), vim.log.levels.WARN)
                end)
                return
            end

            vim.system_theme_watcher = watcher
            vim.api.nvim_create_autocmd("VimLeavePre", {
                group = vim.api.nvim_create_augroup("system_theme_watcher", { clear = true }),
                once = true,
                callback = function()
                    if not watcher:is_closing() then
                        watcher:stop()
                        watcher:close()
                    end
                    if vim.system_theme_watcher == watcher then
                        vim.system_theme_watcher = nil
                    end
                end,
            })
            apply_flavour()
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
