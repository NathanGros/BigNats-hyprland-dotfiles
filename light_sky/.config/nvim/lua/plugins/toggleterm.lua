return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return vim.o.lines * 0.5
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		Normal = {
			link = "PMenu",
		},
		shade_terminals = false,
		start_in_insert = true,
	},
}
