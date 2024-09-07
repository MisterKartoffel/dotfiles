return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
        local catppuccin = require("catppuccin")

        catppuccin.setup({
            flavour = "mocha",
            integrations = {
                cmp = true,
                mason = true,
                neotree = true,
                telescope = true,
                treesitter = true,
                which_key = true,
            },

            vim.cmd.colorscheme("catppuccin")
        })
    end,
}
