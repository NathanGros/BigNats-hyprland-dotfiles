return {
      dir = "~/.config/nvim/lua/myplugins/beige_theme.nvim", -- local path
      lazy = false,
      priority = 1000,
      config = function()
            vim.cmd("colorscheme beige_theme")
      end
}
