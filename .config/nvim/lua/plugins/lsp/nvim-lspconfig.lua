return {
    "neovim/nvim-lspconfig",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true, },
    },

    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.lua_ls.setup({ capabilities = capabilities })
        lspconfig.bashls.setup({ capabilities = capabilities })
        lspconfig.yamlls.setup({ capabilities = capabilities })
        lspconfig.ts_ls.setup({ capabilities = capabilities })
        lspconfig.biome.setup({ capabilities = capabilities })
    end,
}
