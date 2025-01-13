
-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

-- Saves having to define default options for all keymaps, shamelessly stolen from https://github.com/Bvngee/nixconf
local function map(mode, lhs, rhs, opts)
    local default_opts = { silent = true }
    if opts then
        opts = vim.tbl_extend("force", default_opts, opts)
    else
        opts = default_opts
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Vanilla Neovim {{{
map({ "n", "v", "i" }, "<C-ç>", "<CR>", { desc = "Remaps CTRL+ç to ENTER" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected string down a line and autoindent" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected string up a line and autoindent" })

map("n", "<A-o>", "o<Esc>", { desc = "Create a new line below and stay in normal mode" })
map("n", "<A-O>", "O<Esc>", { desc = "Create a new line above and stay in normal mode" })

map("n", "J", "mzJ`z", { desc = "Append line below while keeping cursor still" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down and center screen on cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up and center screen on cursor" })

map("x", "<leader>p", [["_dP]], { desc = "Paste over selected string while keeping current register" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })

map("n", "<leader><leader>", ":w<CR> :so<CR>", { desc = "Save and source current file" })
map("n", "<leader>w", ":w<CR>", { desc = "Save current buffer" })
map("n", "<leader>q", ":wqa<CR>", { desc = "Save and quit all buffers" })
-- }}}

-- Lazygit {{{
map("n", "<leader>gl", ":LazyGit<CR>", { desc = "Open LazyGit" })
-- }}}

-- LSP and None-LS {{{
map("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Display info about symbol under cursor" })
map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition for symbol under cursor" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Displays code actions for annotation under cursor" })
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Autoformat current file" })
-- }}}

-- Markview {{{
map("n", "<leader>mt", ":Markview<CR>", { desc = "Toggle markview" })
-- }}}

-- Nvim-colorizer {{{
map("n", "<leader>cc", ":ColorizerToggle<CR>", { desc = "Toggle color highlighting of current buffer" })
-- }}}

-- Telescope {{{
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recently opened files" })
map("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in CWD" })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help tag" })
map("n", "<leader>fm", ":Telescope man_pages<CR>", { desc = "Find manpage" })
map("n", "<leader>fc", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find files in Neovim configuration directory" })
-- }}}

-- Which-key {{{
map("n", "<leader>?", function()
    require("which-key").show({ global = true })
end, { desc = "Show keymaps" })
--}}}

-- Yazi {{{
map("n", "<leader>e", ":Yazi<CR>", { desc = "Open Yazi" })
-- }}}
