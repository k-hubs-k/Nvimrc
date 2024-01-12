local keymap = vim.keymap

local M = {}

-- set keymaps on the active lsp server
M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	opts.desc = "Go to lsp references"
	vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)

	opts.desc = "Go to declaration"
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts)

	opts.desc = "Go to lsp definitions"
	vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

	opts.desc = "Go to implementations"
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

	opts.desc = "Show Lsp type definitions"
	vim.keymap.set("n", "gi", "<cmd>Telescope lsp_type_definitions<CR>", opts)

	opts.desc = "Code action"
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

	opts.desc = "Rename"
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

	opts.desc = "Buffer diagnostic"
	vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	opts.desc = "Line Diagnostic"
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = "Cursor Diagnostic"
	vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

	opts.desc = "Previous Diagnostic"
	vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, opts)

	opts.desc = "Next Diagnostic"
	vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, opts)

	opts.desc = "Hover"
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = "Outline Toggle"
	vim.keymap.set("n", "<leader>lo", "<cmd>LSoutlineToggle<CR>", opts)

	opts.desc = "Restart LSP"
	vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

	if client.name == "pyright" then
		opts.desc = "Organize import"
		keymap.set("n", "<leader>oi", "<cmd>PyrightOrganizeImports<CR>", opts)
	end
end

return M
