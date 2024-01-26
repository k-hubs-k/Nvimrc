return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		vim.cmd([[hi StatusLine ctermbg=0 cterm=NONE]])
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
		require("transparent").clear_prefix("NvimTree")
		require("transparent").clear_prefix("BufferLine")
		require("transparent").clear_prefix("cmp")
	end,
}
