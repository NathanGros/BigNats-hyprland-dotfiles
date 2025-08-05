return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("custom.lualine_beige_theme")
        -- require("lualine").setup({
        --     options = {
        --         theme = "dracula",
        --     },
        -- })
    end,
}
