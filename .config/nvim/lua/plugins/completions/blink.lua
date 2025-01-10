return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"xzbdmw/colorful-menu.nvim",
		"folke/lazydev.nvim",
		"saghen/blink.cmp",
	},
	version = "*",
	opts = {
		keymap = {
			preset = "none",
			["<A-k>"] = { "select_prev", "fallback" },
			["<A-j>"] = { "select_next", "fallback" },
			["<A-c>"] = { "show_documentation", "hide_documentation", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"fallback",
			},
		},
		completion = {
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
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
					treesitter = { "lsp" },
				},
			},
			keyword = { range = "full" },
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
	},
}
