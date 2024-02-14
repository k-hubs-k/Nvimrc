local format = require("util.icons").format
return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		{ "<leader>j", mode = { "n" }, ":TSJSplit<CR>", desc = format("Down", "Split node") },
		{ "<leader>J", mode = { "n" }, ":TSJJoin<CR>", desc = format("Up", "Join node") },
	},
	opts = {
		use_default_keymaps = false,
	},
}
