return {
    "saghen/blink.cmp",
    enabled = vim.g.blink_enabled,
    event = "InsertEnter",
    build = vim.g.blink_enabled and "RUSTUP_TOOLCHAIN=nightly cargo build --release",
    opts_extend = {
        "sources.completion.enabled_providers",
        "sources.compat",
        "sources.default",
    },
    dependencies = {
        { "saghen/blink.compat", opts = {} },
        "rafamadriz/friendly-snippets",
        "bydlw98/blink-cmp-env",
        "mikavilpas/blink-ripgrep.nvim",
        { "L3MON4D3/LuaSnip", version = "v2.*" },
        {
            "fang2hou/blink-copilot",
            opts = { max_completions = 5, max_attempts = 3 },
        },
    },

    opts = {
        -- Use luasnip as the snippet engine
        snippets = { preset = "luasnip" },

        -- Apperance: LazyVim already handles kind icons, so we just set the variant here
        appearance = {
            nerd_font_variant = "normal",
            kind_icons = vim.tbl_extend(
                "force",
                require("blink.cmp.config.appearance").kind_icons or {},
                LazyVim.config.icons.kinds
            ),
        },

        completion = {
            menu = { border = "rounded" },
            documentation = { window = { border = "rounded" }, auto_show = true },
            ghost_text = { enabled = true },
        },

        signature = { window = { border = "rounded" }, enabled = true },

        sources = {
            default = { "copilot", "lsp", "path", "snippets", "buffer", "ripgrep" },
            per_filetype = { sql = { "dadbod", "buffer" } },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 10,
                    async = true,
                    kind = "Copilot", -- Defined in transform_items if needed
                },
                ripgrep = {
                    name = "Ripgrep",
                    module = "blink-ripgrep",
                    score_offset = -4,
                },
                env = {
                    name = "Env",
                    module = "blink-cmp-env",
                    score_offset = -6,
                },
                dadbod = {
                    name = "DadBod",
                    module = "vim_dadbod_completion.blink",
                    score_offset = -5,
                },
            },
        },

        keymap = {
            preset = "super-tab",
            ["<C-h>"] = { "show" },
            ["<C-y>"] = { "select_and_accept" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-s>"] = { "show_signature" },
            ["<C-S-j>"] = { "scroll_documentation_down" },
            ["<C-S-k>"] = { "scroll_documentation_up" },
        },
    },

    ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
    config = function(_, opts)
        -- setup compat sources
        local enabled = opts.sources.default
        for _, source in ipairs(opts.sources.compat or {}) do
            opts.sources.providers[source] = vim.tbl_deep_extend(
                "force",
                { name = source, module = "blink.compat.source" },
                opts.sources.providers[source] or {}
            )
            if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
                table.insert(enabled, source)
            end
        end

        -- add ai_accept to <Tab> key
        if not opts.keymap["<Tab>"] then
            if opts.keymap.preset == "super-tab" then -- super-tab
                opts.keymap["<Tab>"] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.accept()
                        else
                            return cmp.select_and_accept()
                        end
                    end,
                    LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
                    "fallback",
                }
            else -- other presets
                opts.keymap["<Tab>"] = {
                    LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
                    "fallback",
                }
            end
        end

        -- Unset custom prop to pass blink.cmp validation
        opts.sources.compat = nil

        -- Check if we need to override symbol kinds
        for _, provider in pairs(opts.sources.providers or {}) do
            ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
            if provider.kind then
                local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                local kind_idx = #CompletionItemKind + 1

                CompletionItemKind[kind_idx] = provider.kind
                ---@diagnostic disable-next-line: no-unknown
                CompletionItemKind[provider.kind] = kind_idx

                ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
                local transform_items = provider.transform_items
                ---@param ctx blink.cmp.Context
                ---@param items blink.cmp.CompletionItem[]
                provider.transform_items = function(ctx, items)
                    items = transform_items and transform_items(ctx, items) or items
                    for _, item in ipairs(items) do
                        item.kind = kind_idx or item.kind
                    end
                    return items
                end

                -- Unset custom prop to pass blink.cmp validation
                provider.kind = nil
            end
        end

        require("blink.cmp").setup(opts)
    end,
}
