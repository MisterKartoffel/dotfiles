
-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

local bind = vim.keymap.set -- Saves keystrokes

-- Vanilla Neovim {{{
    bind("v", "J", ":m '>+1<CR>gv=gv")
    bind("v", "K", ":m '<-2<CR>gv=gv")

    bind("n", "<A-o>", "o<Esc>", { desc = "Create a new line below and stay in normal mode" })
    bind("n", "<A-O>", "O<Esc>", { desc = "Create a new line above and stay in normal mode" })

    bind("n", "J", "mzJ`z", { desc = "Append line below while keeping cursor still" })
    bind("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center screen on cursor" })
    bind("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center screen on cursor" })

    bind("x", "<leader>p", [["_dP]], { desc = "Paste over selected string while keeping current register" })

    bind({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
    bind("n", "<leader>Y", [["+Y]], { desc = "Copy whole line to system clipboard" })

    bind({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without copying" })

    bind("n", "<leader><leader>", ":w<CR> :so<CR>", { desc = "Save and source current file" })
-- }}}

-- Auto-session {{{
    bind("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session for CWD" })
    bind("n", "<leader>ws", ":SessionSave<CR>", { desc = "Save session for CWD" })
    bind("n", "<leader>wf", ":SessionSearch<CR>", { desc = "Search sessions" })
-- }}}

-- Lazygit {{{
    bind("n", "<leader>lg", ":LazyGit<CR>", { desc = "Open LazyGit" })
-- }}}

-- LSP and None-LS {{{
    bind("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Display info about symbol under cursor" })
    bind("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition for symbol under cursor" })
    bind("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Displays code actions for annotation under cursor" })
    bind("n", "<leader>cf", vim.lsp.buf.format, { desc = "Autoformat current file" })
-- }}}

-- Neo-tree {{{
    bind("n", "<leader>ee", ":Neotree filesystem toggle left<CR>", { desc = "Toggle tree on/off" })
    bind("n", "<leader>ef", ":Neotree focus<CR>", { desc = "Regain focus on tree" })
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

-- Vim-maximizer {{{
    bind("n", "<C-w>m", ":MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })
-- }}}

-- Which-key {{{
    bind("n", "<leader>?", function() require("which-key").show({ global = true }) end, { desc = "Show keymaps" })
-- }}}
