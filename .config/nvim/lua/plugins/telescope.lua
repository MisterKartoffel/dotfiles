return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            },
        },

        config = function()
            local telescope = require("telescope")

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            }

            telescope.load_extension("fzf")
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",

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
                    live_grep = {
                        hidden = true,
                    },
                    grep_string = {
                        hidden = true,
                    },
                },
            })

            telescope.load_extension("ui-select")
        end,
    },
}
