
-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

-- Saves having to define default options for all keybinds, shamelessly stolen from https://github.com/Bvngee/nixconf
local function bind(mode, lhs, rhs, opts)
    local default_opts = { silent = true }
    if opts then
        opts = vim.tbl_extend("force", default_opts, opts)
    else
        opts = default_opts
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Vanilla Neovim {{{
    bind({"n", "v", "i"}, "<C-ç>", "<CR>", { desc = "Remaps CTRL+ç to ENTER" })

    bind("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected string down a line and autoindent" })
    bind("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected string up a line and autoindent" })

    bind("n", "<A-o>", "o<Esc>", { desc = "Create a new line below and stay in normal mode" })
    bind("n", "<A-O>", "O<Esc>", { desc = "Create a new line above and stay in normal mode" })

    bind("n", "J", "mzJ`z", { desc = "Append line below while keeping cursor still" })
    bind("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center screen on cursor" })
    bind("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center screen on cursor" })

    bind("x", "<leader>p", [["_dP]], { desc = "Paste over selected string while keeping current register" })

    bind({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
    bind({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without copying" })

    bind("n", "<leader><leader>", ":w<CR> :so<CR>", { desc = "Save and source current file" })
    bind("n", "<leader>q", ":wqa<CR>", { desc = "Save and quit all buffers" })
-- }}}

-- Gitsigns {{{
    bind("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview git hunk" })
    bind("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame view" })
-- }}}

-- Lazygit {{{
    bind("n", "<leader>gl", ":LazyGit<CR>", { desc = "Open LazyGit" })
-- }}}

-- LSP and None-LS {{{
    bind("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Display info about symbol under cursor" })
    bind("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition for symbol under cursor" })
    bind("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Displays code actions for annotation under cursor" })
    bind("n", "<leader>cf", vim.lsp.buf.format, { desc = "Autoformat current file" })
-- }}}

-- Markview {{{
    bind("n", "<leader>mt", ":Markview<CR>", { desc = "Toggle markview" })
-- }}}

-- Nvim-colorizer {{{
    bind("n", "<leader>cc", ":ColorizerToggle<CR>", { desc = "Toggle color highlighting of current buffer" })
-- }}}

-- Telescope {{{
    bind("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in CWD" })
    bind("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
    bind("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in CWD" })
    bind("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find string under cursor in CWD" })
-- }}}

-- Which-key {{{
    bind("n", "<leader>?", function() require("which-key").show({ global = true }) end, { desc = "Show keymaps" })
--}}}

-- Yazi {{{
    bind("n", "<leader>e", ":Yazi<CR>", { desc = "Open Yazi" })
-- }}}
