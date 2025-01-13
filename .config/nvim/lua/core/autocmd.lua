vim.api.nvim_create_augroup("bufcheck", { clear = true })

-- Highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Remove autocommenting on new lines
vim.api.nvim_create_autocmd("BufEnter", {
	group = "bufcheck",
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})
