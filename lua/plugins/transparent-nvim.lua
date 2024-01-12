return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		vim.cmd([[hi StatusLine ctermbg=0 cterm=NONE]])
		require("transparent").setup({
			groups = {
				"Normal",
				"NormalINC",
				"Comment",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlinded",
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
			},
			extra_groups = {
				"NormalFloat",
				"",
			},
		})
	end,
}
