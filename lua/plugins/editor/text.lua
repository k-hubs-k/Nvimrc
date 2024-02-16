local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- Line movement
keymap.set({ "n", "i" }, "<A-j>", "<ESC>:MoveLine 1<CR>", opts)
keymap.set({ "n", "i" }, "<A-k>", "<ESC>:MoveLine -1<CR>", opts)
return {
	{
		"fedepujol/move.nvim",
		-- Line movement
		opts = {
			keymap.set({ "n", "i" }, "<A-j>", "<ESC>:MoveLine 1<CR>", opts),
			keymap.set({ "n", "i" }, "<A-k>", "<ESC>:MoveLine -1<CR>", opts),
		},
	},
	{
		--fold
		"kevinhwang91/nvim-ufo",
		event = "BufEnter",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			require("ufo").setup({
				provider_selector = function()
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("illuminate").configure({
				filetypes_denylist = {
					"nvim-tree",
					"dropbar_menu",
					"CodeAction",
				},
			})
		end,
	},
	{
		"mg979/vim-visual-multi",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		keys = {
			{ "cs", mode = { "n" }, desc = "Change surrounding pair" },
			{ "ds", mode = { "n" }, desc = "Delete surrounding pair" },
			{ "ys", mode = { "n" }, desc = "Add surrounding pair" },
			{ "S", mode = { "v" }, desc = "Add surrounding pair" },
		},
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		-- toggle boolean values
		"rmagatti/alternate-toggler",
	},
}
