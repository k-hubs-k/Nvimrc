local icons = require("util.icons").icons
return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		-- vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=None]])
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			filters = {
				custom = { "^.git$", "^node_modules$" },
			},
			git = {
				enable = false,
			},
			log = {
				enable = true,
				types = {
					diagnostics = true,
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				debounce_delay = 50,
				icons = {
					hint = icons.Hint,
					info = icons.Info,
					warning = icons.Warn,
					error = icons.Error,
				},
			},
		})
	end,
}
