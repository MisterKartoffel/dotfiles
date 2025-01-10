return {
	"norcalli/nvim-colorizer.lua",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	opts = {
		user_default_options = {
			RRGGBBAA = true,
			AARRGGBB = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			mode = "background",
			always_update = true,
		},
	},
}
