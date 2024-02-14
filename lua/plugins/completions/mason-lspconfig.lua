local config = function()
	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = {
			"html",
			"lua_ls",
			"pyright",
			"tsserver",
			"lua_ls",
			"cssls",
			"svelte",
			"emmet_language_server",
			"pyright",
			"bashls",
			"taplo",
			"tailwindcss",
			"vimls",
			"jsonls",
			"jdtls",
			"marksman",
		},

		automatic_installation = true,
	})
end

return {
	"williamboman/mason-lspconfig.nvim",
	envent = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
	config = config,
}
