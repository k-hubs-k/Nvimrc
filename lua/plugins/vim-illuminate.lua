-- Highlight variable or propriety when the cursor in under this (variable)

return {
	"RRethy/vim-illuminate",
	lazy = false,
	config = function()
		require("illuminate").configure({})
	end,
}
