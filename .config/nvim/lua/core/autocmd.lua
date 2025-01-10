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
