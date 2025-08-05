return {
    dir = vim.fn.stdpath("config") .. "/lua/myplugins/beige-theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme beige-theme")
    end,
}
