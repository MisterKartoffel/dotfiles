return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
        "xzbdmw/colorful-menu.nvim",
        "folke/lazydev.nvim",
    },
    version = "*",
    opts = {
        keymap = {
            preset = "none",
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<Esc>"] = { "hide", "fallback" },
            ["<Tab>"] = {
                function(cmp)
                    if cmp.snippet_active() then return cmp.accept()
                    else return cmp.select_and_accept() end
                end,
                "snippet_forward",
                "fallback",
            },
        },
        completion = {
            menu = {
                draw = {
                    columns = {
                        { "kind_icon" },
                        { "label", gap = 1 },
                    },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
            keyword = { range = "full" },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
            },
            ghost_text = { enabled = true },
        },
        snippets = { preset = "luasnip" },
        sources = {
            default = {
                "lazydev",
                "lsp",
                "snippets",
                "buffer",
                "path",
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
        signature = { enabled = true },
    }
}
