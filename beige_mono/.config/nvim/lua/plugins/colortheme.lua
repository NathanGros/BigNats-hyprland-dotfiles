return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- or "latte", "frappe", "macchiato"
			})
		end,
	},

	{
		dir = vim.fn.stdpath("config") .. "/lua/myplugins/beige-theme.nvim",
		name = "beige-theme",
		lazy = false,
		priority = 1000,
        config = function ()
            -- Beige theme (comment to change theme)
			vim.cmd("colorscheme beige-theme")

            -- Catppuccin theme (uncomment to use)
			-- vim.cmd("colorscheme catppuccin")
        end
	},
}
