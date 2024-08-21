return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "jsonls",
                    "bashls",
                    "cssls",
                    "harper_ls",
                    "yamlls",
                    "hyprls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.jsonls.setup({})
            lspconfig.bashls.setup({})
            lspconfig.cssls.setup({})
            lspconfig.harper_ls.setup({})
            lspconfig.yamlls.setup({})
            lspconfig.hyprls.setup({})
        end,
    },
}
