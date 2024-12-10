return {
    "mistricky/codesnap.nvim",
    lazy = true,
    build = "make build_generator",
    keys = {
        { "<leader>sc", "<cmd>CodeSnap<cr>", mode = "v", desc = "Snapshot into clipboard" },
        { "<leader>ss", "<cmd>CodeSnapSave<cr>", mode = "v", desc = "Snapshot into ~/Pictures" },
    },
    opts = {
        mac_window_bar = true,
        title = "Screenshot",
        save_path = "~/Pictures/CodeSnapshot",
        code_font_family = "JetBrainsMono Nerd Font Mono",
        has_breadcrumbs = true,
        show_workspace = true,
        has_line_number = true,
        bg_theme = "grape",
        bg_x_padding = 40,
        bg_y_padding = 40,
        watermark = "",
        min_width = 0,
    },
}
