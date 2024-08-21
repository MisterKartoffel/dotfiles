vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.g.mapleader = " "

local keybind = vim.keymap.set -- Saves keystrokes

-- Neotree keybindings
keybind("n", "<leader>ee", ":Neotree filesystem toggle left<CR>", { desc = "Toggle tree on/off" })
keybind("n", "<leader>ef", ":Neotree focus<CR>", { desc = "Regain focus on tree" })

-- LSP keybindings
keybind("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Display info about symbol under cursor" })
keybind("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition for symbol under cursor" })
keybind("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Displays code actions for annotation under cursor" })

-- None-LS keybindings
keybind("n", "<leader>af", vim.lsp.buf.format, { desc = "Autoformat current file" })

-- Telescope keybindings
keybind("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in CWD" })
keybind("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
keybind("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in CWD" })
keybind("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find string under cursor in CWD" })

-- WhichKey keybindings
keybind("n", "<leader>?", function() require("which-key").show({ global = true }) end, { desc = "Show local keymaps" })

-- Vim-maximizer keybindings
keybind("n", "<C-w>m", ":MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- Auto-session keybindings
keybind("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session for CWD" })
keybind("n", "<leader>ws", ":SessionSave<CR>", { desc = "Save session for CWD" })
