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

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type

		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	lspconfig["html"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "html", "javascriptreact", "typescriptreact" },
	})

	-- typescript
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

	-- emmet
	lspconfig["emmet_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sass", "scss", "less", "svelte" },
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

	lspconfig.jdtls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = config,
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
	},
}
