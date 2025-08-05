return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- Lualine beige theme (comment to change theme)
        require("custom.lualine_beige_theme")

        -- Lualine dracula theme (uncomment to use)
        -- require("lualine").setup({
        --     options = {
        --         theme = "dracula",
        --     },
        -- })
    end,
}
