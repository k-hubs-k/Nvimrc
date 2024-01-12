local config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	require("luasnip.loaders.from_vscode").lazy_load()
	local lspkind = require("lspkind")

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,preview,noselect",
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(), -- Manually show suggestions
			["<C-e>"] = cmp.mapping.abort(), -- close completion
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		-- Sources of autocompletion
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
		}),
		-- configure lspking for vs-code like icons
		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},
	})
	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	-- Set up lspconfig.
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	require("lspconfig")["cssls"].setup({
		capabilities = capabilities,
	})
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	config = config,
	dependencies = {
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completions
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-vsnip", -- snippet completions
		"hrsh7th/vim-vsnip",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"hrsh7th/cmp-nvim-lsp", -- lsp completions
		"hrsh7th/cmp-nvim-lua", -- neovim lua api completions
	},
}
