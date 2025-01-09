return {
    "neovim/nvim-lspconfig",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = { "saghen/blink.cmp", },

    config = function()
        local capabilities = require("blink-cmp").get_lsp_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({ capabilities = capabilities })
        lspconfig.bashls.setup({ capabilities = capabilities })
        lspconfig.vimls.setup({ capabilities = capabilities })
    end
}
