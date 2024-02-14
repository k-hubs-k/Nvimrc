local config = function()
	require("tokyonight").setup({
		on_highlights = function(hl, c)
			hl.TelescopeNormal = {
				bg = c.bg_dark,
				fg = c.fg_dark,
			}
			hl.TelescopeBorder = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopePreviewTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
			hl.TelescopeResultsTitle = {
				bg = c.bg_dark,
				fg = c.bg_dark,
			}
		end,
	})
end

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 998,
	config = config,
}
