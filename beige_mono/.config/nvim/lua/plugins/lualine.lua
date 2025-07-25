return {
      "nvim-lualine/lualine.nvim",
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()

            -- get colors
            local colors = require('beige_theme').colors()

            local beige_theme = {
                  normal = {
                        a = {bg = colors.menubg, fg = colors.gray2, gui = 'bold'},
                        b = {bg = colors.menubg, fg = colors.gray2},
                        c = {bg = colors.bg, fg = colors.gray2},
                        x = {bg = colors.menubg, fg = colors.gray2},
                        y = {bg = colors.menubg, fg = colors.gray2},
                        z = {bg = colors.menubg, fg = colors.gray2}
                  },
                  insert = {
                        a = {bg = colors.blue, fg = colors.fg, gui = 'bold'},
                        b = {bg = colors.menubg, fg = colors.gray2},
                        c = {bg = colors.bg, fg = colors.gray2},
                        x = {bg = colors.menubg, fg = colors.gray2},
                        y = {bg = colors.menubg, fg = colors.gray2},
                        z = {bg = colors.menubg, fg = colors.gray2}
                  },
                  visual = {
                        a = {bg = colors.bright_magenta, fg = colors.fg, gui = 'bold'},
                        b = {bg = colors.menubg, fg = colors.gray2},
                        c = {bg = colors.bg, fg = colors.gray2},
                        x = {bg = colors.menubg, fg = colors.gray2},
                        y = {bg = colors.menubg, fg = colors.gray2},
                        z = {bg = colors.menubg, fg = colors.gray2}
                  },
                  replace = { a = {bg = colors.red, fg = colors.fg, gui = 'bold'},
                        b = {bg = colors.menubg, fg = colors.gray2},
                        c = {bg = colors.bg, fg = colors.gray2},
                        x = {bg = colors.menubg, fg = colors.gray2},
                        y = {bg = colors.menubg, fg = colors.gray2},
                        z = {bg = colors.menubg, fg = colors.gray2}
                  },
                  command = {
                        a = {bg = colors.green, fg = colors.fg, gui = 'bold'},
                        b = {bg = colors.menubg, fg = colors.gray2},
                        c = {bg = colors.bg, fg = colors.gray2},
                        x = {bg = colors.menubg, fg = colors.gray2},
                        y = {bg = colors.menubg, fg = colors.gray2},
                        z = {bg = colors.menubg, fg = colors.gray2}
                  },
                  inactive = {
                        a = {bg = colors.bg, fg = colors.menubg, gui = 'bold'},
                        b = {bg = colors.menubg, fg = colors.gray2},
                        c = {bg = colors.bg, fg = colors.gray2},
                        x = {bg = colors.menubg, fg = colors.gray2},
                        y = {bg = colors.menubg, fg = colors.gray2},
                        z = {bg = colors.menubg, fg = colors.gray2}
                  }
            }

            -- some functions
            local function mode_color()
                  local mode = vim.fn.mode()
                  local mode_color = ({
                        n = colors.menubg,
                        i = colors.blue,
                        v = colors.bright_magenta,
                        V = colors.bright_magenta,
                        ['\22'] = colors.bright_magenta,
                        R = colors.red,
                        c = colors.green
                  })[mode] or colors.bg
                  return mode_color
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

            -- setup
            require('lualine').setup {
                  options = {
                        theme = beige_theme,
                        component_separators = '',
                        section_separators = '',
                  },
                  sections = {
                        lualine_a = {
                              -- mode block
                              {
                                    function() return ' ' end,
                                    color = function()
                                          return { fg = mode_color(), bg = colors.bg }
                                    end,
                                    padding = 0
                              },
                              { 'mode' },
                              {
                                    function() return '' end,
                                    color = function()
                                          return { fg = mode_color(), bg = colors.bg }
                                    end,
                                    padding = 0
                              }
                        },
                        lualine_b = {
                              -- git block
                              { 'tostring(" ")', cond = has_git, color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              {
                                    'branch',
                                    color = { bg = colors.menubg, fg = colors.gray2 }
                              },
                              {
                                    'diff',
                                    color = { bg = colors.menubg, fg = colors.gray2 }
                              },
                              { 'tostring("")', cond = has_git, color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              -- diagnostics block
                              { 'tostring(" ")', cond = has_diagnostics, color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              {
                                    'diagnostics',
                                    source = { 'nvim' },
                                    sections = { 'error' },
                                    symbols = { error = ' ' },
                                    diagnostics_color = { error = { bg = colors.menubg, fg = colors.error } },
                              },
                              {
                                    'diagnostics',
                                    source = { 'nvim' },
                                    sections = { 'warn' },
                                    symbols = { warn = ' ' },
                                    diagnostics_color = { warn = { bg = colors.menubg, fg = colors.warning } },
                              },
                              {
                                    'diagnostics',
                                    source = { 'nvim' },
                                    sections = { 'info' },
                                    symbols = { info = ' ' },
                                    diagnostics_color = { info = { bg = colors.menubg, fg = colors.info } },
                              },
                              {
                                    'diagnostics',
                                    source = { 'nvim' },
                                    sections = { 'hint' },
                                    symbols = { hint = ' ' },
                                    diagnostics_color = { hint = { bg = colors.menubg, fg = colors.hint } },
                              },
                              { 'tostring("")', cond = has_diagnostics, color = { fg = colors.menubg, bg = colors.bg }, padding = 0 }
                        },
                        lualine_c = {
                              -- filename block
                              { 'tostring(" ")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              { 'filename', color = { fg = colors.gray2, bg = colors.menubg } },
                              { 'tostring("")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 }
                        },
                        lualine_x = {
                              -- lsp block
                              { 'tostring(" ")', cond = has_lsp, color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              'lsp_status',
                              { 'tostring("")', cond = has_lsp, color = { fg = colors.menubg, bg = colors.bg }, padding = 0 }
                        },
                        lualine_y = {
                              -- filetype block
                              { 'tostring(" ")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              'filetype',
                              { 'tostring("")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 }
                        },
                        lualine_z = {
                              -- cursor position block
                              { 'tostring(" ")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              { 'progress', icon = '󰇀', padding = { right = 1 } },
                              { 'location', padding = 0 },
                              { 'tostring("")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              -- time block
                              { 'tostring(" ")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              'tostring(os.date("%H:%M"))',
                              { 'tostring("")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 }
                        },
                  },
                  inactive_sections = {
                        lualine_a = {},
                        lualine_b = {},
                        lualine_c = {
                              -- filename block
                              { 'tostring(" ")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 },
                              { 'filename', color = { fg = colors.gray2, bg = colors.menubg } },
                              { 'tostring("")', color = { fg = colors.menubg, bg = colors.bg }, padding = 0 }
                        },
                        lualine_x = {},
                        lualine_y = {},
                        lualine_z = {},
                  },
            }
      end
}
