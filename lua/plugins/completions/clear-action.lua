local format = require("util.icons").format

return {
	"luckasRanarison/clear-action.nvim",
	event = "LspAttach",
	opts = {
		signs = {
			show_count = false,
			show_label = true,
			combine = true,
		},
		mappings = {
			code_action = { "<leader>la", format("Fix", "Code action") },
			apply_first = { "<leader>aa", format("Fix", "Apply") },
			quickfix = { "<leader>aq", format("Fix", "Quickfix") },
			quickfix_next = { "<leader>an", format("Fix", "Quickfix next") },
			quickfix_prev = { "<leader>ap", format("Fix", "Quickfix prev") },
			refactor = { "<leader>ar", format("Fix", "Refactor") },
			refactor_inline = { "<leader>aR", format("Fix", "Refactor inline") },
		},
	},
}
