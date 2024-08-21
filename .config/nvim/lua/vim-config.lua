vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.g.mapleader = " "

local keymap = vim.keymap -- Saves keystrokes

-- Neotree keybindings
keymap.set("n", "<leader>ee", ":Neotree filesystem toggle left<CR>", { desc = "Toggle tree on/off" })
keymap.set("n", "<leader>ef", ":Neotree focus<CR>", { desc = "Regain focus on tree" })

-- LSP keybindings
keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Display info about symbol under cursor" })
keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition for symbol under cursor" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Displays code actions for annotation under cursor" })

-- None-LS keybindings
keymap.set("n", "<leader>nf", vim.lsp.buf.format, { desc = "Autoformat current file" })

-- Telescope keybindings
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in CWD" })
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in CWD" })
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find string under cursor in CWD" })

-- WhichKey keybindings
keymap.set("n", "<leader>?", function() require("which-key").show({ global = false }) end, { desc = "Show local keymaps" })

-- Auto-session keybindings
keymap.set("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session for CWD" })
keymap.set("n", "<leader>ws", ":SessionSave<CR>", { desc = "Save session for CWD" })
