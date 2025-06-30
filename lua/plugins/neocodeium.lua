local opts = {
    -- If `false`, then would not start windsurf server (disabled state)
    -- You can manually enable it at runtime with `:NeoCodeium enable`
    enabled = true,
    -- Path to a custom windsurf server binary (you can download one from:
    -- https://github.com/Exafunction/codeium/releases)
    bin = nil,
    -- When set manual to `true`, autosuggestions are disabled.
    -- Use `require'neodecodeium'.cycle_or_complete()` to show suggestions manually
    manual = false,
    -- Information about the API server to use
    server = {
        -- API URL to use (for Enterprise mode)
        api_url = nil,
        -- Portal URL to use (for registering a user and downloading the binary)
        portal_url = nil,
    },
    -- Set to `false` to disable showing the number of suggestions label in the line number column
    show_label = true,
    -- Set to `true` to enable suggestions debounce
    debounce = true,
    -- Maximum number of lines parsed from loaded buffers (current buffer always fully parsed)
    -- Set to `0` to disable parsing non-current buffers (may lower suggestion quality)
    -- Set it to `-1` to parse all lines
    max_lines = 10000,
    -- Set to `true` to disable some non-important messages, like "NeoCodeium: server started..."
    silent = false,
    -- Set to `false` to enable suggestions in special buftypes, like `nofile` etc.
    disable_in_special_buftypes = true,
    -- Sets default log level. One of "trace", "debug", "info", "warn", "error"
    log_level = "info",
    -- Set `enabled` to `true` to enable single line mode.
    -- In this mode, multi-line suggestions would collapse into a single line and only
    -- shows full lines when on the end of the suggested (accepted) line.
    -- So it is less distracting and works better with other completion plugins.
    single_line = {
        enabled = false,
        label = "...", -- Label indicating that there is multi-line suggestion.
    },
    filter = function(bufnr)
        if vim.endswith(vim.api.nvim_buf_get_name(bufnr), ".env") then
            return false
        end
        return true
    end,
    -- Set to `false` to disable suggestions in buffers with specific filetypes
    -- You can still enable disabled by this option buffer with `:NeoCodeium enable_buffer`
    filetypes = {
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["."] = false,
    },
    -- List of directories and files to detect workspace root directory for Windsurf Chat
    root_dir = { ".bzr", ".git", ".hg", ".svn", "_FOSSIL_", "package.json" },
}

return {
    "monkoose/neocodeium",
    event = "VeryLazy",
    enabled = (vim.g.ai_cmp == "neocodeium"),
    config = function()
        local neocodeium = require("neocodeium")
        neocodeium.setup(opts)

        -- Keymaps configuration using which-key
        -- In macos, <A> - alt key is similar to the option key
        local wk = require("which-key")
        wk.add({
            { "<A-l>", neocodeium.accept, desc = "Accept suggestion", mode = "i" },
            { "<A-;>", neocodeium.accept_line, desc = "Accept line", mode = "i" },
            { "<A-'>", neocodeium.accept_word, desc = "Accept word", mode = "i" },
            {
                "<A-n>",
                function()
                    neocodeium.cycle_or_complete()
                end,
                desc = "Next suggestion",
                mode = "i",
            },
            {
                "<A-p>",
                function()
                    neocodeium.cycle_or_complete(-1)
                end,
                desc = "Previous suggestion",
                mode = "i",
            },
            { "<A-.>", neocodeium.clear, desc = "Clear suggestion", mode = "i" },
        })
    end,
}
