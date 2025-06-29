local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- extras ai
        -- { import = "lazyvim.plugins.extras.ai.copilot" }, -- no need because already config manually
        { import = "lazyvim.plugins.extras.ai.copilot-chat" },
        -- extras coding
        { import = "lazyvim.plugins.extras.coding.mini-surround" },
        { import = "lazyvim.plugins.extras.coding.neogen" },
        { import = "lazyvim.plugins.extras.coding.yanky" },
        -- extras dap
        { import = "lazyvim.plugins.extras.dap.core" },
        -- extras lang
        { import = "lazyvim.plugins.extras.lang.python" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.docker" },
        { import = "lazyvim.plugins.extras.lang.sql" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.lang.yaml" },
        { import = "lazyvim.plugins.extras.lang.toml" },
        { import = "lazyvim.plugins.extras.lang.markdown" },
        -- extras ui
        { import = "lazyvim.plugins.extras.ui.mini-animate" },
        { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
        -- { import = "lazyvim.plugins.extras.ui.edgy" },
        { import = "lazyvim.plugins.extras.ui.treesitter-context" },
        -- extras lsp
        { import = "lazyvim.plugins.extras.lsp.none-ls" },
        -- extras test
        { import = "lazyvim.plugins.extras.test.core" },
        -- extras editor
        { import = "lazyvim.plugins.extras.editor.illuminate" },
        { import = "lazyvim.plugins.extras.editor.mini-diff" },
        { import = "lazyvim.plugins.extras.editor.aerial" },
        { import = "lazyvim.plugins.extras.editor.navic" },
        { import = "lazyvim.plugins.extras.editor.telescope" },
        { import = "lazyvim.plugins.extras.editor.fzf" },
        -- extras formatting
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        -- extras util
        { import = "lazyvim.plugins.extras.util.project" },
        { import = "lazyvim.plugins.extras.util.startuptime" },
        -- import/override with your plugins
        { import = "plugins" },
        { import = "lsp" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = true,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        -- version = false, -- always use the latest git commit
        version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = false }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
