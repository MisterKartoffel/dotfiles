return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        integrations = {
            cmp = true,
            mason = true,
            neotree = true,
            telescope = true,
            treesitter = true,
            which_key = true,
        },
    },
}
