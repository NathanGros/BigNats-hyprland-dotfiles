return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        local highlight = {
            "WinSeparator",
        }
        require("ibl").setup({
            indent = { highlight = highlight, char = "▏" },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = false,
            },
            scope = { enabled = true },
        })
    end,
}
