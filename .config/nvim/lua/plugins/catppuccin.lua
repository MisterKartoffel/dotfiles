return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
        local catppuccin = require("catppuccin")
        vim.cmd.colorscheme("catppuccin")

        catppuccin.setup({
            flavour = "mocha",
            integrations = {
                mason = true,
                neotree = true,
                cmp = true,
                treesitter = true,
                telescope = true,
                which_key = true,
            },
        })
    end
}
