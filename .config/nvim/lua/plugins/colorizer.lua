return {
    "norcalli/nvim-colorizer.lua",
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    opts = {
        DEFAULT_OPTIONS = {
            RGB = true,
            RRGGBB = true;
            names = true;
            RRGGBBAA = true;
            rgb_fn = true;
            hsl_fn = true;
            css = true;
            css_fn = true;
            mode = "background";
        },
    },
}
