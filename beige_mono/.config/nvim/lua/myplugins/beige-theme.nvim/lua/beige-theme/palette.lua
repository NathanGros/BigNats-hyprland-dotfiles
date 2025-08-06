local colors = {
      black          = "#3e4044",
      gray1          = "#717171",
      gray2          = "#8a8a8a",
      gray3          = "#b0a89e",
      gray4          = "#bab2a8",
      gray5          = "#c4bcb2",
      gray6          = "#cec6bc",
      gray7          = "#dad2c8",
      gray8          = "#e4dfd0",
      gray9          = "#f5e9e0",
      white          = "#fff7ed",

      red            = "#ca7081",
      orange         = "#ba823a",
      yellow         = "#92963a",
      green          = "#3ea57b",
      cyan           = "#22839b",
      blue           = "#6e8dd5",
      magenta        = "#806db8",

      bright_red     = "#d38f97",
      bright_orange  = "#bd8b63",
      bright_yellow  = "#b0b060",
      bright_green   = "#81a98e",
      bright_cyan    = "#00a0ba",
      bright_blue    = "#8192c2",
      bright_magenta = "#ac78bd"
}

colors.fg = colors.black
colors.bg = colors.white
colors.menubg = colors.gray9
colors.nontext = colors.gray5

colors.comment = colors.gray3
colors.literal = colors.bright_yellow
colors.class = colors.orange
colors.string = colors.green
colors.keyword = colors.bright_magenta
colors.func = colors.blue
colors.type = colors.bright_orange
colors.variable = colors.gray1
colors.variable_important = colors.fg

colors.error = colors.red
colors.warning = colors.bright_yellow
colors.info = colors.blue
colors.hint = colors.bright_cyan

return colors

-- M.base_16 = {
      --       base00 = "#fff7ed",
      --       base01 = "#ebe3d9",
      --       base02 = "#f2e6d4",
      --       base03 = "#cecece",
      --       base04 = "#9e9e9e",
      --       base05 = "#636363",
      --       base06 = "#3e4044",
      --       base07 = "#24272b",
      --       base08 = "#ca7081",
      --       base09 = "#6e8dd5",
      --       base0a = "#ba823a",
      --       base0b = "#3ea57b",
      --       base0c = "#22839b",
      --       base0d = "#4380bc",
      --       base0e = "#ac78bd",
      --       base0f = "#92963a",
      -- }
