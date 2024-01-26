local keymap = vim.keymap
local format = require("util.icons").format
local icons = require("util.icons").icons

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	opts.desc = "Go to lsp references"
	vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)

	opts.desc = format("Definition", "Go to declaration")
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts)

	opts.desc = format("Definition", "Go to lsp definitions")
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

	opts.desc = format("Definition", "Go to implementations")
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

	opts.desc = format("Definition", "Lsp type definitions")
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_type_definitions<CR>", opts)

	opts.desc = format("Action", "Code action")
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

	opts.desc = "Rename"
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

	opts.desc = "Buffer diagnostic"
	vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	opts.desc = format("Debug", "Line Diagnostic")
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = format("Debug", "Cursor Diagnostic")
	vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

	-- hover (what is under cursor)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = format("Restart", "Restart LSP")
	vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

	if client.name == "pyright" then
		opts.desc = "Organize import"
		keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
	end

	opts.desc = format("Run", "Compile")
	if client.name == "gopls" then
		keymap.set("n", "<leader>b", '<cmd>"TermExec cmd=go run ."<CR>', opts)
	end
end

return M
