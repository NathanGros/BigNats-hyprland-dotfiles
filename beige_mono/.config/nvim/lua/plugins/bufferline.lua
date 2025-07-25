return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "NeoTreeNormal",
						text_align = "center",
						separator = true,
					},
				},
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and "  " or (e == "warning" and "  " or "  ")
						s = s .. n .. sym
					end
					return s
				end,
			},
		})
	end,
}
