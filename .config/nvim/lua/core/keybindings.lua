
-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

local bind = vim.keymap.set -- Saves keystrokes

-- Vanilla Neovim {{{
    bind({"n", "v", "i"}, "<C-ç>", "<CR>", { desc = "Remaps CTRL+ç to ENTER", silent = true })
    bind("n", ";", ":", { desc = "Opens command mode from normal mode", silent = true })

    bind("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected string down a line and autoindent", silent = true })
    bind("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected string up a line and autoindent", silent = true })

    bind("n", "<A-o>", "o<Esc>", { desc = "Create a new line below and stay in normal mode", silent = true })
    bind("n", "<A-O>", "O<Esc>", { desc = "Create a new line above and stay in normal mode", silent = true })

    bind("n", "J", "mzJ`z", { desc = "Append line below while keeping cursor still", silent = true })
    bind("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center screen on cursor", silent = true })
    bind("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center screen on cursor", silent = true })

    bind("x", "<leader>p", [["_dP]], { desc = "Paste over selected string while keeping current register", silent = true })

    bind({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard", silent = true })
    bind({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without copying", silent = true })

    bind("n", "<leader><leader>", ":w<CR> :so<CR>", { desc = "Save and source current file", silent = true })
    bind("n", "<leader>q", ":wqa<CR>", { desc = "Save and quit all buffers", silent = true })
-- }}}

-- Gitsigns {{{
    bind("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview git hunk", silent = true })
    bind("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame view", silent = true })
-- }}}

-- Lazygit {{{
    bind("n", "<leader>gl", ":LazyGit<CR>", { desc = "Open LazyGit", silent = true })
-- }}}

-- LSP and None-LS {{{
    bind("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Display info about symbol under cursor", silent = true })
    bind("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition for symbol under cursor", silent = true })
    bind("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Displays code actions for annotation under cursor", silent = true })
    bind("n", "<leader>cf", vim.lsp.buf.format, { desc = "Autoformat current file", silent = true })
-- }}}

-- Nvim-colorizer {{{
    bind("n", "<leader>cc", ":ColorizerToggle<CR>", { desc = "Toggle color highlighting of current buffer", silent = true })
-- }}}

-- Telescope {{{
    bind("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in CWD", silent = true })
    bind("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files", silent = true })
    bind("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in CWD", silent = true })
    bind("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find string under cursor in CWD", silent = true })
-- }}}

-- Which-key {{{
    bind("n", "<leader>?", function() require("which-key").show({ global = true }) end, { desc = "Show keymaps", silent = true })
--}}}

-- Yazi {{{
    bind("n", "<leader>e", ":Yazi<CR>", { desc = "Open Yazi", silent = true })
-- }}}
