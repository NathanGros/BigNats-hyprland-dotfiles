local C = require("catppuccin.palettes").get_palette()

local beige_theme = {
	normal = {
		a = { bg = C.crust, fg = C.text, gui = "bold" },
		b = { bg = C.crust, fg = C.text },
		c = { bg = C.base, fg = C.text },
		x = { bg = C.crust, fg = C.text },
		y = { bg = C.crust, fg = C.text },
		z = { bg = C.crust, fg = C.text },
	},
	insert = {
		a = { bg = C.blue, fg = C.crust, gui = "bold" },
		b = { bg = C.crust, fg = C.text },
		c = { bg = C.base, fg = C.text },
		x = { bg = C.crust, fg = C.text },
		y = { bg = C.crust, fg = C.text },
		z = { bg = C.crust, fg = C.text },
	},
	visual = {
		a = { bg = C.mauve, fg = C.crust, gui = "bold" },
		b = { bg = C.crust, fg = C.text },
		c = { bg = C.base, fg = C.text },
		x = { bg = C.crust, fg = C.text },
		y = { bg = C.crust, fg = C.text },
		z = { bg = C.crust, fg = C.text },
	},
	replace = {
		a = { bg = C.red, fg = C.crust, gui = "bold" },
		b = { bg = C.crust, fg = C.text },
		c = { bg = C.base, fg = C.text },
		x = { bg = C.crust, fg = C.text },
		y = { bg = C.crust, fg = C.text },
		z = { bg = C.crust, fg = C.text },
	},
	command = {
		a = { bg = C.green, fg = C.crust, gui = "bold" },
		b = { bg = C.crust, fg = C.text },
		c = { bg = C.base, fg = C.text },
		x = { bg = C.crust, fg = C.text },
		y = { bg = C.crust, fg = C.text },
		z = { bg = C.crust, fg = C.text },
	},
	terminal = {
		a = { bg = C.peach, fg = C.crust, gui = "bold" },
		b = { bg = C.crust, fg = C.text },
		c = { bg = C.base, fg = C.text },
		x = { bg = C.crust, fg = C.text },
		y = { bg = C.crust, fg = C.text },
		z = { bg = C.crust, fg = C.text },
	},
	inactive = {
		a = { bg = C.base, fg = C.crust, gui = "bold" },
		b = { bg = C.crust, fg = C.text },
		c = { bg = C.base, fg = C.text },
		x = { bg = C.crust, fg = C.text },
		y = { bg = C.crust, fg = C.text },
		z = { bg = C.crust, fg = C.text },
	},
}

-- some functions
local function mode_color()
	local mode = vim.fn.mode()
	local mode_colors = ({
		n = C.blue,
		i = C.green,
		v = C.mauve,
		V = C.mauve,
		["\22"] = C.mauve,
		R = C.red,
		c = C.teal,
		t = C.peach,
	})[mode] or C.crust
	return mode_colors
end

local function has_git()
	return vim.b.gitsigns_head ~= nil
end

local function has_diagnostics()
	local diagnostics = vim.diagnostic.get(0)
	return #diagnostics > 0
end

local function has_lsp()
	for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
		if client and client.attached_buffers and client.attached_buffers[vim.api.nvim_get_current_buf()] then
			return true
		end
	end
	return false
end

local function is_not_tree()
	return vim.bo.filetype ~= "neo-tree"
end

local function is_not_terminal()
	return vim.bo.filetype ~= "toggleterm"
end

local function is_not_dashboard()
	return vim.bo.filetype ~= "alpha"
end


local basic_block_separator_color = { fg = C.crust, bg = C.base }
local basic_block_color = { fg = C.text, bg = C.crust }


return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = beige_theme,
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = {
				-- mode block
				{
					'tostring(" ")',
					color = function()
						return { fg = mode_color(), bg = C.base }
					end,
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					padding = 0,
				},
				{
					"mode",
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					color = function()
						return { fg = C.base, bg = mode_color(), gui = "bold" }
					end,
				},
				{
					'tostring("")',
					color = function()
						return { fg = mode_color(), bg = C.base }
					end,
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					padding = 0,
				},
			},
			lualine_b = {
				-- git block
				{
					'tostring(" ")',
					cond = function()
						return has_git() and is_not_tree()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
				{
					"branch",
					cond = function()
						return has_git() and is_not_tree()
					end,
					color = basic_block_color,
				},
				{
					"diff",
					cond = function()
						return has_git() and is_not_tree()
					end,
					color = basic_block_color,
				},
				{
					'tostring("")',
					cond = function()
						return has_git() and is_not_tree()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
				-- diagnostics block
				{
					'tostring(" ")',
					cond = function()
						return has_diagnostics() and is_not_tree()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
				{
					"diagnostics",
					cond = function()
						return has_diagnostics() and is_not_tree()
					end,
					source = { "nvim" },
					sections = { "error" },
					symbols = { error = " " },
					diagnostics_color = { error = { bg = C.crust, fg = C.red } },
				},
				{
					"diagnostics",
					cond = function()
						return has_diagnostics() and is_not_tree()
					end,
					source = { "nvim" },
					sections = { "warn" },
					symbols = { warn = " " },
					diagnostics_color = { warn = { bg = C.crust, fg = C.yellow } },
				},
				{
					"diagnostics",
					cond = function()
						return has_diagnostics() and is_not_tree()
					end,
					source = { "nvim" },
					sections = { "info" },
					symbols = { info = " " },
					diagnostics_color = { info = { bg = C.crust, fg = C.blue } },
				},
				{
					"diagnostics",
					cond = function()
						return has_diagnostics() and is_not_tree()
					end,
					source = { "nvim" },
					sections = { "hint" },
					symbols = { hint = " " },
					diagnostics_color = { hint = { bg = C.crust, fg = C.teal } },
				},
				{
					'tostring("")',
					cond = function()
						return has_diagnostics() and is_not_tree()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
			},
			lualine_c = {
				-- filename block
				{
					'tostring(" ")',
					cond = function()
						return is_not_tree() and is_not_terminal() and is_not_dashboard()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
				{
					"filename",
					cond = function()
						return is_not_tree() and is_not_terminal() and is_not_dashboard()
					end,
					color = basic_block_color,
				},
				{
					'tostring("")',
					cond = function()
						return is_not_tree() and is_not_terminal() and is_not_dashboard()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
			},
			lualine_x = {
				-- lsp block
				{
					'tostring(" ")',
					cond = function()
						return has_lsp() and is_not_tree()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
				{
					cond = function()
						return has_lsp() and is_not_tree()
					end,
					"lsp_status",
				},
				{
					'tostring("")',
					cond = function()
						return has_lsp() and is_not_tree()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
			},
			lualine_y = {
				-- filetype block
				{
					'tostring(" ")',
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
				{
					"filetype",
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
				},
				{
					'tostring("")',
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
			},
			lualine_z = {
				-- cursor position block
				{
					'tostring(" ")',
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
				{
					"progress",
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					icon = "󰇀",
					padding = { right = 1 },
				},
				{
					"location",
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					padding = 0,
				},
				{
					'tostring("")',
					cond = function()
						return is_not_tree() and is_not_dashboard()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				-- filename block
				{
					'tostring(" ")',
					cond = function()
						return is_not_tree() and is_not_terminal() and is_not_dashboard()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
				{
					"filename",
					cond = function()
						return is_not_tree() and is_not_terminal() and is_not_dashboard()
					end,
					color = basic_block_color,
				},
				{
					'tostring("")',
					cond = function()
						return is_not_tree() and is_not_terminal() and is_not_dashboard()
					end,
					color = basic_block_separator_color,
					padding = 0,
				},
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	}
}
