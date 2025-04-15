return {
    "saghen/blink.cmp",
    version = not vim.g.lazyvim_blink_main and "*",
    event = "InsertEnter",
    enabled = vim.g.blink_enabled,
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    opts_extend = {
        "sources.completion.enabled_providers",
        "sources.compat",
        "sources.default",
    },
    dependencies = {
        "rafamadriz/friendly-snippets",
        -- add blink.compat to dependencies
        {
            "saghen/blink.compat",
            optional = true, -- make optional so it's only enabled if any extras need it
            opts = {},
            version = not vim.g.lazyvim_blink_main and "*",
        },
        "huijiro/blink-cmp-supermaven",
    },

    opts = {
        snippets = {
            expand = function(snippet, _)
                return LazyVim.cmp.expand(snippet)
            end,
        },

        appearance = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = false,
            -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
            kind_icons = vim.tbl_extend("keep", {
                Color = "██", -- Use block instead of icon for color items to make swatches more usable
            }, LazyVim.config.icons.kinds),
        },

        completion = {
            accept = {}, -- use all default https://cmp.saghen.dev/configuration/reference.html#completion-accept
            menu = {
                border = "rounded",
                draw = {
                    treesitter = { "lsp" },
                },
                scrollbar = false, -- dont show the scrollbar
            },
            list = {
                max_items = 50,
            },
            documentation = {
                auto_show = true,
                window = {
                    border = "rounded",
                },
            },
            ghost_text = {
                enabled = vim.g.ai_cmp, -- only show for ai completion
            },
        },

        -- experimental signature help support
        signature = {
            enabled = true,
            window = { border = "rounded" },
        },

        sources = {
            -- adding any nvim-cmp sources here will enable them
            -- with blink.compat
            per_filetype = { sql = { "dadbod" } },
            providers = {
                -- INFO: score_offset list
                -- supermaven: -5
                -- lazydev: -4
                -- buffer: -3
                -- snippets: -1
                -- lsp: 0
                -- path: 3
                -- ripgrep: 4
                -- dadbod: 5
                supermaven = {
                    name = "Supermaven",
                    module = "blink-cmp-supermaven",
                    score_offset = -5,
                    async = true,
                },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = -4,
                },
                ripgrep = {
                    name = "Ripgrep",
                    module = "blink-cmp-rg",
                    score_offset = 4,
                    -- options below are optional, these are the default values
                    ---@type blink-cmp-rg.Options
                    opts = {
                        -- `min_keyword_length` only determines whether to show completion items in the menu,
                        -- not whether to trigger a search. And we only has one chance to search.
                        prefix_min_len = 3,
                        get_command = function(context, prefix)
                            return {
                                "rg",
                                "--no-config",
                                "--json",
                                "--word-regexp",
                                "--ignore-case",
                                "--",
                                prefix .. "[\\w_-]+",
                                vim.fs.root(0, ".git") or vim.fn.getcwd(),
                            }
                        end,
                        get_prefix = function(context)
                            return context.line:sub(1, context.cursor[2]):match("[%w_-]+$") or ""
                        end,
                    },
                },
                dadbod = {
                    kind = "DadBod",
                    module = "vim_dadbod_completion.blink",
                    score_offset = 5,
                },
            },
        },

        keymap = {
            preset = "enter",
            ["<C-y>"] = { "select_and_accept" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-h>"] = {
                function(cmp)
                    cmp.show()
                end,
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
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
                    require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
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
