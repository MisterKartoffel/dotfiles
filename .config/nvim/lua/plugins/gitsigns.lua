return {
    "lewis6991/gitsigns.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        worktrees = {
            toplevel = "$HOME",
            gitdir = "$HOME/Dotfiles",
        },
    },
}
