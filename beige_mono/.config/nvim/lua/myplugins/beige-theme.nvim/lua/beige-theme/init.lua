local M = {}

local TRANSPARENTS = {
      "Normal",
      "SignColumn",
      "NvimTreeNormal",
      "NvimTreeVertSplit",
}

local function apply_term_colors(colors)
      vim.g.terminal_color_0 = colors.black
      vim.g.terminal_color_1 = colors.red
      vim.g.terminal_color_2 = colors.green
      vim.g.terminal_color_3 = colors.yellow
      vim.g.terminal_color_4 = colors.purple
      vim.g.terminal_color_5 = colors.pink
      vim.g.terminal_color_6 = colors.cyan
      vim.g.terminal_color_7 = colors.white
      vim.g.terminal_color_8 = colors.gray6
      vim.g.terminal_color_9 = colors.bright_red
      vim.g.terminal_color_10 = colors.bright_green
      vim.g.terminal_color_11 = colors.bright_yellow
      vim.g.terminal_color_12 = colors.bright_blue
      vim.g.terminal_color_13 = colors.bright_magenta
      vim.g.terminal_color_14 = colors.bright_cyan
      vim.g.terminal_color_15 = colors.white
      vim.g.terminal_color_background = colors.gray8
      vim.g.terminal_color_foreground = colors.black
end

local function apply(opts)
      local colors = require("beige-theme.palette")
      apply_term_colors(colors)
      local groups = require("beige-theme.groups").setup()

      -- apply transparents
      if opts.transparent then
            for _, group in ipairs(TRANSPARENTS) do
                  groups[group].bg = nil
            end
      end

      -- set defined highlights
      for group, setting in pairs(groups) do
            vim.api.nvim_set_hl(0, group, setting)
      end
end

M.opts = {
      italic_comment = true,
      transparent = false,
}

M.setup = function(opts)
      M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})
end

M.load = function()
      if vim.fn.has("nvim-0.7") ~= 1 then
            vim.notify("beige-theme.nvim: you must use neovim 0.7 or higher")
            return
      end

      -- reset colors
      if vim.g.colors_name then
            vim.cmd("hi clear")
      end

      if vim.fn.exists("syntax_on") then
            vim.cmd("syntax reset")
      end

      vim.o.background = "dark"
      vim.o.termguicolors = true
      vim.g.colors_name = "beige-theme"

      apply(M.opts)
end

M.colors = function()
      local colors = require("beige-theme.palette")
      return colors
end

return M
