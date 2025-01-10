vim.api.nvim_create_augroup("bufcheck", { clear = true })

-- Highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "bufcheck",
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Remove autocommenting on new lines
vim.api.nvim_create_autocmd("BufEnter", {
    group = "bufcheck",
    pattern = "",
    command = "set fo-=c fo-=r fo-=o",
})

-- Autoformat on LSP-attached buffers
vim.api.nvim_create_autocmd("LspAttach", {
    group = "bufcheck",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})
