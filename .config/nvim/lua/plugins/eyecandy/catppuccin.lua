return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        default_integrations = true,
        integrations = {
            alpha = true,
            cmp = true,
            gitsigns = true,
            indent_blankline = {
                enabled = true,
                scope_color = "text",
            },
            mason = true,
            mini = {
                enabled = true,
            },
            noice = true,
            notify = true,
            telescope = true,
            treesitter = true,
            which_key = true,
        },
    },
}
