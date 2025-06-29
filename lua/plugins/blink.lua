return {
    "saghen/blink.cmp",
    version = not vim.g.blink_enabled and "*",
    event = "InsertEnter",
    enabled = vim.g.blink_enabled,
    build = vim.g.blink_enabled and "RUSTUP_TOOLCHAIN=nightly cargo build --release",
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
            version = not vim.g.blink_enabled and "*",
        },
        "bydlw98/blink-cmp-env", -- for env completion
        "mikavilpas/blink-ripgrep.nvim", --for ripgrep completion
        { "L3MON4D3/LuaSnip", version = "v2.*" }, -- for luasnip completion
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = { preset = "luasnip" },

        appearance = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = false,
            -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- adjusts spacing to ensure icons are aligned
            nerd_font_variant = "normal",
            -- Instead of using default icons, we use the ones from LazyVim
            kind_icons = vim.tbl_extend(
                "force",
                require("blink.cmp.config.appearance").kind_icons or {},
                LazyVim.config.icons.kinds
            ),
            -- INFO: Default kind_icons
            -- kind_icons = {
            --     Text = "󰉿",
            --     Method = "󰊕",
            --     Function = "󰊕",
            --     Constructor = "󰒓",
            --     Field = "󰜢",
            --     Variable = "󰆦",
            --     Property = "󰖷",
            --     Class = "󱡠",
            --     Interface = "󱡠",
            --     Struct = "󱡠",
            --     Module = "󰅩",
            --     Unit = "󰪚",
            --     Value = "󰦨",
            --     Enum = "󰦨",
            --     EnumMember = "󰦨",
            --     Keyword = "󰻾",
            --     Constant = "󰏿",
            --     Snippet = "󱄽",
            --     Color = "󰏘",
            --     File = "󰈔",
            --     Reference = "󰬲",
            --     Folder = "󰉋",
            --     Event = "󱐋",
            --     Operator = "󰪚",
            --     TypeParameter = "󰬛",
            -- },
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
                enabled = (vim.g.ai_cmp == "neocodeium"), -- only show for ai completion
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
            default = { "omni", "buffer", "snippets", "lsp", "path", "ripgrep", "dadbod", "env" },
            providers = {
                --[[
                INFO: score_offset order list:
                - omni: 6
                - path: 3
                - lsp: 0
                - buffer: -3
                - snippets: -1
                - lazydev: -2
                - ripgrep: -4
                - dadbod: -5
                - env: -6
                ]]
                omni = {
                    score_offset = 6,
                },
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = -2,
                },
                ripgrep = {
                    name = "Ripgrep",
                    module = "blink-ripgrep",
                    score_offset = -4,
                    -- options below are optional, these are the default values
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
                    score_offset = -5,
                },
                env = {
                    name = "Env",
                    module = "blink-cmp-env",
                    score_offset = -6,
                    --- @type blink-cmp-env.Options
                    opts = {
                        item_kind = require("blink.cmp.types").CompletionItemKind.Variable,
                        show_braces = false,
                        show_documentation_window = true,
                    },
                },
            },
        },

        keymap = {
            preset = "enter",
            ["<C-h>"] = { "show" },
            ["<C-y>"] = { "select_and_accept" },
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-s>"] = { "show_signature" },
            ["<C-S-j>"] = { "scroll_documentation_down" },
            ["<C-S-k>"] = { "scroll_documentation_up" },
            -- INFO: Super Tab
            -- Description: Use <Tab> to select the next item in the completion menu, and <S-Tab> to select the previous item.
            ["<Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then
                        return cmp.accept()
                    else
                        return cmp.select_and_accept()
                    end
                end,
                "snippet_forward",
                "fallback",
            },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
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
