return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local button = dashboard.button

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
            button("e", "  ❱ New file", "<CMD>ene <BAR> startinsert <CR>"),
            button("SPC ff", "  ❱ Find file", "<CMD>cd $HOME | <CMD>Telescope find_files<CR>"),
            button("SPC fs", "󰱼  ❱ Find string", "<CMD>cd $HOME<CR> <CMD>Telescope live_grep<CR>"),
            button("SPC fr", "󱋡  ❱ Recent", "<CMD>Telescope oldfiles<CR>"),
            button("SPC wr", "  ❱ Restore past session", "<CMD>SessionRestore<CR>"),
            button("SPC wf", "  ❱ Search session", "<CMD>SessionSearch<CR>"),
            button("s", "  ❱ Settings", "<CMD>e $MYVIMRC<CR> <CMD>cd $HOME/.config/nvim<CR> <CMD>Neotree filesystem toggle left<CR>"),
            button("q", "󰩈  ❱ Quit Neovim", "<CMD>qa<CR>"),
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
