return {
    "lewis6991/gitsigns.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        signs = {
            add     = { text = '+' },
            change  = { text = '~' },
        },
        signs_staged = {
            add     = { text = '+' },
            change  = { text = '~' },
        },
        worktrees = {
            {
                toplevel = vim.env.HOME,
                gitdir = vim.env.HOME .. "/Dotfiles",
            },
        },
        current_line_blame_opts = {
            delay = 100,
        },
    },
}
