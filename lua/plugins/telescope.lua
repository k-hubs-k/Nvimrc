local keymap = vim.keymap
local format = require("util.icons").format
local opts = { noremap = true, silent = true }

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
	keys = {
		keymap.set(
			"n",
			"<leader>fk",
			":Telescope keymaps<CR>",
			{ desc = format("Search", "Find keymaps"), noremap = true, silent = true }
		),
		keymap.set(
			"n",
			"<leader>fh",
			":Telescope help_tags<CR>",
			{ desc = format("Help", "Help Tags"), noremap = true, silent = true }
		),
		keymap.set(
			"n",
			"<leader>ff",
			":Telescope find_files<CR>",
			{ desc = format("Search", "Find file"), noremap = true, silent = true }
		),
		keymap.set(
			"n",
			"<leader>fg",
			":Telescope live_grep<CR>",
			{ desc = format("Search", "Find words in project") },
			opts
		),
		keymap.set(
			"n",
			"<leader>fb",
			":Telescope buffers<CR>",
			{ desc = format("Open", "Opened Buffers"), noremap = true, silent = true }
		),
	},
}
