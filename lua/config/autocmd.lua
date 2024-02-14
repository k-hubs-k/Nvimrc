-- Disable tmux status
vim.cmd("autocmd VimEnter * silent !tmux set status off")

-- Auto update buffer on modification on other editor
vim.cmd("autocmd FocusGained * :checktime")

-- Clean space in end of line
vim.cmd("autocmd BufWritePre * :%s/s+s$//e")

-- Auto set a window size of buffer on the window size change
vim.cmd("autocmd VimResized * wincmd = ")

-- auto reload vim config when the config file change
vim.cmd([[
    autocmd! BufWritePost $MYVIMRC source %
]])

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 500,
		})
	end,
})
