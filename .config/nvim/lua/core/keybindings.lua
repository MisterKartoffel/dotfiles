
-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

local keybind = vim.keymap.set -- Saves keystrokes

-- Vanilla Neovim {{{
    keybind("v", "J", ":m '>+1<CR>gv=gv")
    keybind("v", "K", ":m '<-2<CR>gv=gv")

    keybind("n", "<A-o>", "o<Esc>", { desc = "Create a new line below and stay in normal mode" })
    keybind("n", "<A-O>", "O<Esc>", { desc = "Create a new line above and stay in normal mode" })

    keybind("n", "J", "mzJ`z", { desc = "Append line below while keeping cursor still" })
    keybind("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center screen on cursor" })
    keybind("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center screen on cursor" })

    keybind("x", "<leader>p", [["_dP]], { desc = "Paste over selected string while keeping current register" })

    keybind({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
    keybind("n", "<leader>Y", [["+Y]], { desc = "Copy whole line to system clipboard" })

    keybind({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without copying" })

    keybind("n", "<leader><leader>", ":w<CR> :so<CR>", { desc = "Save and source current file" })
-- }}}

-- Auto-session {{{
    keybind("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session for CWD" })
    keybind("n", "<leader>ws", ":SessionSave<CR>", { desc = "Save session for CWD" })
    keybind("n", "<leader>wf", ":SessionSearch<CR>", { desc = "Search sessions" })
-- }}}

-- Lazygit {{{
    keybind("n", "<leader>lg", ":LazyGit<CR>", { desc = "Open LazyGit" })
-- }}}

-- LSP and None-LS {{{
    keybind("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Display info about symbol under cursor" })
    keybind("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition for symbol under cursor" })
    keybind("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Displays code actions for annotation under cursor" })
    keybind("n", "<leader>cf", vim.lsp.buf.format, { desc = "Autoformat current file" })
-- }}}

-- Neo-tree {{{
    keybind("n", "<leader>ee", ":Neotree filesystem toggle left<CR>", { desc = "Toggle tree on/off" })
    keybind("n", "<leader>ef", ":Neotree focus<CR>", { desc = "Regain focus on tree" })
-- }}}

-- Nvim-colorizer {{{
    keybind("n", "<leader>cc", ":ColorizerToggle<CR>", { desc = "Toggle color highlighting of current buffer" })
-- }}}

-- Telescope {{{
    keybind("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in CWD" })
    keybind("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
    keybind("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in CWD" })
    keybind("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find string under cursor in CWD" })
-- }}}

-- Vim-maximizer {{{
    keybind("n", "<C-w>m", ":MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })
-- }}}

-- Which-key {{{
    keybind("n", "<leader>?", function() require("which-key").show({ global = true }) end, { desc = "Show keymaps" })
-- }}}
