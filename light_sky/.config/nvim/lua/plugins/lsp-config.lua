-- lua, c, bash, typescript, javascript, html, css, python, java, ocaml, rust
local lsps = {
	"lua_ls",
	"clangd",
	"bashls",
	"ts_ls",
	"html",
	"cssls",
	"ruff",
	"pyright",
	"jdtls",
	"ocamllsp",
	"rust_analyzer",
}

return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = lsps,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.diagnostic.config({
				virtual_text = {
					spacing = 2,
					prefix = function(diagnostic)
						local icons = {
							[vim.diagnostic.severity.ERROR] = " ",
							[vim.diagnostic.severity.WARN] = " ",
							[vim.diagnostic.severity.INFO] = " ",
							[vim.diagnostic.severity.HINT] = " ",
						}
						return icons[diagnostic.severity] or "●"
					end,
				},
				signs = false,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			for _, lspname in ipairs(lsps) do
                vim.lsp.enable(lspname)
                vim.lsp.config(lspname, capabilities)
			end
		end,
	},
}
