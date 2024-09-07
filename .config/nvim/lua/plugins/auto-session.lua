return {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    opts = {
        auto_restore = false,
        suppressed_dirs = {
            "~/",
            "~/Downloads/",
            "~/Wallpapers/",
            "~/Documents/",
            "~/Screenshots/",
        },
        session_lens = {
            previewer = true,
        },
    },
}
