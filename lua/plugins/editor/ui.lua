return {
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		config = function()
			-- vim.cmd([[hi StatusLine ctermbg=0 cterm=NONE]])
			require("transparent").setup({
				groups = {
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr",
					"EndOfBuffer",
					"InsertEnter",
				},
				extra_groups = {
					"NormalFloat",
					"CursorLine",
					"TablineFill",
				},
			})
			require("transparent").clear_prefix("BufferLine")
			require("transparent").clear_prefix("NvimTree")
			require("transparent").clear_prefix("cmp")
			require("transparent").clear_prefix("Telescope")
			require("transparent").clear_prefix("Twilight")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 999,
		config = function()
			vim.cmd("colorscheme tokyonight")
			vim.cmd("Twilight")
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
}
