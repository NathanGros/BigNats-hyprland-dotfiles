return {
	dir = vim.fn.stdpath("config") .. "/lua/myplugins/toggle-theme.nvim",
	dependencies = {
		"catppuccin/nvim",
		"nvim-lualine/lualine.nvim",
	},
	config = function ()
		require("toggle-theme").setup("beige_theme")
	end
}
