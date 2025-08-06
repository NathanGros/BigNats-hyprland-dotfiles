local M = {}

function M.setup()
    -- get colors
    local colors = require("beige-theme").colors()

    local beige_theme = {
        normal = {
            a = { bg = colors.gray7, fg = colors.gray2, gui = "bold" },
            b = { bg = colors.gray7, fg = colors.gray2 },
            c = { bg = colors.menubg, fg = colors.gray2 },
            x = { bg = colors.gray7, fg = colors.gray2 },
            y = { bg = colors.gray7, fg = colors.gray2 },
            z = { bg = colors.gray7, fg = colors.gray2 },
        },
        insert = {
            a = { bg = colors.blue, fg = colors.fg, gui = "bold" },
            b = { bg = colors.gray7, fg = colors.gray2 },
            c = { bg = colors.menubg, fg = colors.gray2 },
            x = { bg = colors.gray7, fg = colors.gray2 },
            y = { bg = colors.gray7, fg = colors.gray2 },
            z = { bg = colors.gray7, fg = colors.gray2 },
        },
        visual = {
            a = { bg = colors.bright_magenta, fg = colors.fg, gui = "bold" },
            b = { bg = colors.gray7, fg = colors.gray2 },
            c = { bg = colors.menubg, fg = colors.gray2 },
            x = { bg = colors.gray7, fg = colors.gray2 },
            y = { bg = colors.gray7, fg = colors.gray2 },
            z = { bg = colors.gray7, fg = colors.gray2 },
        },
        replace = {
            a = { bg = colors.red, fg = colors.fg, gui = "bold" },
            b = { bg = colors.gray7, fg = colors.gray2 },
            c = { bg = colors.menubg, fg = colors.gray2 },
            x = { bg = colors.gray7, fg = colors.gray2 },
            y = { bg = colors.gray7, fg = colors.gray2 },
            z = { bg = colors.gray7, fg = colors.gray2 },
        },
        command = {
            a = { bg = colors.green, fg = colors.fg, gui = "bold" },
            b = { bg = colors.gray7, fg = colors.gray2 },
            c = { bg = colors.menubg, fg = colors.gray2 },
            x = { bg = colors.gray7, fg = colors.gray2 },
            y = { bg = colors.gray7, fg = colors.gray2 },
            z = { bg = colors.gray7, fg = colors.gray2 },
        },
        terminal = {
            a = { bg = colors.orange, fg = colors.fg, gui = "bold" },
            b = { bg = colors.gray7, fg = colors.gray2 },
            c = { bg = colors.menubg, fg = colors.gray2 },
            x = { bg = colors.gray7, fg = colors.gray2 },
            y = { bg = colors.gray7, fg = colors.gray2 },
            z = { bg = colors.gray7, fg = colors.gray2 },
        },
        inactive = {
            a = { bg = colors.menubg, fg = colors.gray7, gui = "bold" },
            b = { bg = colors.gray7, fg = colors.gray2 },
            c = { bg = colors.menubg, fg = colors.gray2 },
            x = { bg = colors.gray7, fg = colors.gray2 },
            y = { bg = colors.gray7, fg = colors.gray2 },
            z = { bg = colors.gray7, fg = colors.gray2 },
        },
    }

    -- some functions
    local function mode_color()
        local mode = vim.fn.mode()
        local mode_colors = ({
            n = colors.gray7,
            i = colors.blue,
            v = colors.bright_magenta,
            V = colors.bright_magenta,
            ["\22"] = colors.bright_magenta,
            R = colors.red,
            c = colors.green,
            t = colors.orange,
        })[mode] or colors.bg
        return mode_colors
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

    local function is_not_tree()
        return vim.bo.filetype ~= "neo-tree"
    end

    local function is_not_terminal()
        return vim.bo.filetype ~= "toggleterm"
    end

    local function is_not_dashboard()
        return vim.bo.filetype ~= "alpha"
    end

    -- setup
    require("lualine").setup({
        options = {
            theme = beige_theme,
            component_separators = "",
            section_separators = "",
        },
        sections = {
            lualine_a = {
                -- mode block
                {
                    'tostring(" ")',
                    color = function()
                        return { fg = mode_color(), bg = colors.menubg }
                    end,
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                    padding = 0,
                },
                {
                    "mode",
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                },
                {
                    'tostring("")',
                    color = function()
                        return { fg = mode_color(), bg = colors.menubg }
                    end,
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                    padding = 0,
                },
            },
            lualine_b = {
                -- git block
                {
                    'tostring(" ")',
                    cond = function()
                        return has_git() and is_not_tree()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                {
                    "branch",
                    cond = function()
                        return has_git() and is_not_tree()
                    end,
                    color = { bg = colors.gray7, fg = colors.gray2 },
                },
                {
                    "diff",
                    cond = function()
                        return has_git() and is_not_tree()
                    end,
                    color = { bg = colors.gray7, fg = colors.gray2 },
                },
                {
                    'tostring("")',
                    cond = function()
                        return has_git() and is_not_tree()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                -- diagnostics block
                {
                    'tostring(" ")',
                    cond = function()
                        return has_diagnostics() and is_not_tree()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                {
                    "diagnostics",
                    cond = function()
                        return has_diagnostics() and is_not_tree()
                    end,
                    source = { "nvim" },
                    sections = { "error" },
                    symbols = { error = " " },
                    diagnostics_color = { error = { bg = colors.gray7, fg = colors.error } },
                },
                {
                    "diagnostics",
                    cond = function()
                        return has_diagnostics() and is_not_tree()
                    end,
                    source = { "nvim" },
                    sections = { "warn" },
                    symbols = { warn = " " },
                    diagnostics_color = { warn = { bg = colors.gray7, fg = colors.warning } },
                },
                {
                    "diagnostics",
                    cond = function()
                        return has_diagnostics() and is_not_tree()
                    end,
                    source = { "nvim" },
                    sections = { "info" },
                    symbols = { info = " " },
                    diagnostics_color = { info = { bg = colors.gray7, fg = colors.info } },
                },
                {
                    "diagnostics",
                    cond = function()
                        return has_diagnostics() and is_not_tree()
                    end,
                    source = { "nvim" },
                    sections = { "hint" },
                    symbols = { hint = " " },
                    diagnostics_color = { hint = { bg = colors.gray7, fg = colors.hint } },
                },
                {
                    'tostring("")',
                    cond = function()
                        return has_diagnostics() and is_not_tree()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
            },
            lualine_c = {
                -- filename block
                {
                    'tostring(" ")',
                    cond = function()
                        return is_not_tree() and is_not_terminal() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                {
                    "filename",
                    cond = function()
                        return is_not_tree() and is_not_terminal() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray2, bg = colors.gray7 },
                },
                {
                    'tostring("")',
                    cond = function()
                        return is_not_tree() and is_not_terminal() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
            },
            lualine_x = {
                -- lsp block
                {
                    'tostring(" ")',
                    cond = function()
                        return has_lsp() and is_not_tree()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                {
                    cond = function()
                        return has_lsp() and is_not_tree()
                    end,
                    "lsp_status",
                },
                {
                    'tostring("")',
                    cond = function()
                        return has_lsp() and is_not_tree()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
            },
            lualine_y = {
                -- filetype block
                {
                    'tostring(" ")',
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                {
                    "filetype",
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                },
                {
                    'tostring("")',
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
            },
            lualine_z = {
                -- cursor position block
                {
                    'tostring(" ")',
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                {
                    "progress",
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                    icon = "󰇀",
                    padding = { right = 1 },
                },
                {
                    "location",
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                    padding = 0,
                },
                {
                    'tostring("")',
                    cond = function()
                        return is_not_tree() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                -- time block
                {
                    'tostring(" ")',
                    cond = function()
                        return is_not_tree()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                {
                    'tostring(os.date("%H:%M"))',
                    cond = function()
                        return is_not_tree()
                    end,
                },
                {
                    'tostring(" ")',
                    cond = function()
                        return is_not_tree()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                -- filename block
                {
                    'tostring(" ")',
                    cond = function()
                        return is_not_tree() and is_not_terminal() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
                {
                    "filename",
                    cond = function()
                        return is_not_tree() and is_not_terminal() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray2, bg = colors.gray7 },
                },
                {
                    'tostring("")',
                    cond = function()
                        return is_not_tree() and is_not_terminal() and is_not_dashboard()
                    end,
                    color = { fg = colors.gray7, bg = colors.menubg },
                    padding = 0,
                },
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
    })
end

return M
