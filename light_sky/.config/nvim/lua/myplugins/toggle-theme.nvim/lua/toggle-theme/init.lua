local M = {}

M.current_theme = "beige_theme"

local function toggle()
	if M.current_theme == "beige" then
		vim.cmd("colorscheme catppuccin")
        require("custom.lualine_catppuccin").setup()
		M.current_theme = "catppuccin"
	else
		vim.cmd("colorscheme beige-theme")
		require("custom.lualine_beige_theme").setup()
		M.current_theme = "beige"
	end
end

function M.setup(opts)
    if opts == "catppuccin" then
		vim.cmd("colorscheme catppuccin")
        require("custom.lualine_catppuccin").setup()
		M.current_theme = "catppuccin"
    else
        if opts == "beige_theme" then
            vim.cmd("colorscheme beige-theme")
            require("custom.lualine_beige_theme").setup()
            M.current_theme = "beige"
        else
            opts = {}
        end
	end
end

vim.api.nvim_create_user_command("ToggleTheme", toggle, {})

return M
