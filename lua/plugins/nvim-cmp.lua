local scrollbar = require("noice.view.scrollbar")
local function has_words_before()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    enabled = vim.g.cmp_enabled,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "onsails/lspkind-nvim",
        "hrsh7th/cmp-emoji",
    },

    -- Not all LSP servers add brackets when completing a function.
    -- To better deal with this, LazyVim adds a custom option to cmp,
    -- that you can configure. For example:
    --
    -- ```lua
    -- opts = {
    --   auto_brackets = { "python" }
    -- }
    -- ```
    opts = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        local auto_select = true
        return {
            auto_brackets = {}, -- configure any filetype to auto add brackets
            completion = {
                completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
            },
            preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.scroll_docs(-4),
                ["<C-n>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.complete(),
                ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
                ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
                ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                -- INFO: Super Tab
                ["<Tab>"] = cmp.mapping(function(fallback)
                    -- INFO: the local variable suggestion is high prioritized for AI completion
                    -- currently none AI provider
                    local suggestion = require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1]
                    if suggestion.has_suggestion() then
                        suggestion.on_accept_suggestion()
                    elseif cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif vim.snippet.active({ direction = 1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(1)
                        end)
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif vim.snippet.active({ direction = -1 }) then
                        vim.schedule(function()
                            vim.snippet.jump(-1)
                        end)
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
            },
            formatting = {
                format = function(entry, item)
                    local icons = LazyVim.config.icons.kinds
                    if icons[item.kind] then
                        item.kind = icons[item.kind] .. item.kind
                    end

                    local widths = {
                        abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                        menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                    }

                    for key, width in pairs(widths) do
                        if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                            item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                        end
                    end

                    return item
                end,
            },
            experimental = {
                ghost_text = {
                    hl_group = "CmpGhostText",
                },
            },
            window = {
                documentation = cmp.config.window.bordered({
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
                    scrollbar = false,
                }),
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
                    scrollbar = false,
                }),
            },
            sorting = defaults.sorting, -- use default sorting
            -- NOTE: menu interation with copilot suggestion
            -- cmp.event:on("menu_opened", function()
            --     vim.b.copilot_suggestion_hidden = true
            -- end),

            -- cmp.event:on("menu_closed", function()
            --     vim.b.copilot_suggestion_hidden = false
            -- end),
        }
    end,
    main = "lazyvim.util.cmp",
}
