return {
	"williamboman/mason.nvim",
	priority = 10,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- Server list
			ensure_installed = {
				"html",
				"tsserver",
				"cssls",
				"marksman",
				"tailwindcss",
				"jsonls",
				"bashls",
				"gopls",
				"taplo", -- toml lsp
				"emmet_language_server",
				"vimls",
				"intelephense", -- php lsp
				"lua_ls",
				"pyright",
				"jdtls", -- java lsp
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua", --lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python formatter
				"eslint_d", -- js formatter
			},
		})
	end,
}
