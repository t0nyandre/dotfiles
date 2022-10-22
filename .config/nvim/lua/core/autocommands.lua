local autocmd = vim.api.nvim_create_autocmd

-- don't list quickfix buffers
autocmd("FileType", {
	pattern = { "qf", "help", "man", "lspinfo" },
	callback = function()
		vim.opt_local_buflisted = false
	end,
})

autocmd("FileType", {
	pattern = { "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})


