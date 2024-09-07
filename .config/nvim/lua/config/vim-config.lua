
-- █▀▀ █░░ █▀█ █▄▄ ▄▀█ █░░   █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
-- █▄█ █▄▄ █▄█ █▄█ █▀█ █▄▄   ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.g.mapleader = " "


-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

local keybind = vim.keymap.set -- Saves keystrokes

-- Auto-session keybindings
keybind("n", "<leader>wr", "<CMD>SessionRestore<CR>", { desc = "Restore session for CWD" })
keybind("n", "<leader>ws", "<CMD>SessionSave<CR>", { desc = "Save session for CWD" })
keybind("n", "<leader>wf", "<CMD>SessionSearch<CR>", { desc = "Search sessions" })

-- Lazygit keybindings
keybind("n", "<leader>lg", "<CMD>LazyGit<CR>", { desc = "Open LazyGit" })

-- LSP and None-LS keybindings
keybind("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Display info about symbol under cursor" })
keybind("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition for symbol under cursor" })
keybind("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Displays code actions for annotation under cursor" })
keybind("n", "<leader>cf", vim.lsp.buf.format, { desc = "Autoformat current file" })

-- Neo-tree keybindings
keybind("n", "<leader>ee", "<CMD>Neotree filesystem toggle left<CR>", { desc = "Toggle tree on/off" })
keybind("n", "<leader>ef", "<CMD>Neotree focus<CR>", { desc = "Regain focus on tree" })

-- Nvim-colorizer keybindings
keybind("n", "<leader>cc", "<CMD>ColorizerToggle<CR>", { desc = "Toggle color highlighting of current buffer" })

-- Telescope keybindings
keybind("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Fuzzy find files in CWD" })
keybind("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
keybind("n", "<leader>fs", "<CMD>Telescope live_grep<CR>", { desc = "Find string in CWD" })
keybind("n", "<leader>fc", "<CMD>Telescope grep_string<CR>", { desc = "Find string under cursor in CWD" })

-- Vim-maximizer keybindings
keybind("n", "<C-w>m", "<CMD>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- Which-key keybindings
keybind("n", "<leader>?", function() require("which-key").show({ global = true }) end, { desc = "Show keymaps" })
