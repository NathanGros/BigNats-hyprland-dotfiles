return {
    dir = vim.fn.stdpath("config") .. "/lua/myplugins/code-runner.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
        require("code-runner").setup()
    end,
}
