return {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", },

    config = function()
        local telescope = require("telescope")
        local themes = require("telescope.themes")

        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    themes.get_dropdown({}),
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
        })

        telescope.load_extension("ui-select")
    end,
}
