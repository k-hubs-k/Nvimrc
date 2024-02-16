local icons = require("util.icons").icons

local config = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp") -- completion source

	local on_attach = require("util.lsp").on_attach

	local capabilities = cmp_nvim_lsp.default_capabilities()

	local signs = {
		Error = icons.Error,
		Warn = icons.Warn,
		Hint = icons.Hint,
		Info = icons.Info,
	}
	require("lspconfig.ui.windows").default_options.border = "rounded"

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type

		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	vim.diagnostic.config({
		float = {
			border = "rounded",
		},
	})

	lspconfig["html"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "html", "javascriptreact", "typescriptreact", "php" },
	})

	-- typescript, javascript
	lspconfig["tsserver"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- css
	lspconfig["cssls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		validate = true,
	})

	-- markdown
	lspconfig["marksman"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- tailwindcss
	lspconfig["tailwindcss"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["jsonls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["bashls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["gopls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["taplo"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- emmet
	lspconfig["emmet_language_server"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "php", "javascriptreact", "javascript", "typescript", "typescriptreact" },
	})

	lspconfig["vimls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["intelephense"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "php" },
	})

	-- Lua
	lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- python
	lspconfig["pyright"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	lspconfig["jdtls"].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	capabilities = capabilities
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = config,
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"windwp/nvim-autopairs",
	},
}
