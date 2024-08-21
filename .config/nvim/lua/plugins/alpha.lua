return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("e", "  ❱ New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("SPC ff", "  ❱ Find file", ":cd $HOME | :Telescope find_files<CR>"),
            dashboard.button("SPC fs", "󰱼  ❱ Find string", ":cd $HOME | :Telescope live_grep<CR>"),
            dashboard.button("SPC fr", "󱋡  ❱ Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("SPC wr", "  ❱ Restore past session", ":SessionRestore<CR>"),
            dashboard.button("s", "  ❱ Settings", ":e $MYVIMRC | :cd $HOME/.config/nvim | :Neotree filesystem toggle left<CR>"),
            dashboard.button("q", "󰩈  ❱ Quit Neovim", ":qa<CR>"),
        }
        local function footer()
            local total_plugins = require("lazy").stats().count
            local version = vim.version()
            local nvim_version_info = "   Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

            return "  " .. total_plugins .. " plugins" .. nvim_version_info
        end
        dashboard.section.footer.val = footer()
        alpha.setup(dashboard.opts)
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
        ]])
    end,
}
