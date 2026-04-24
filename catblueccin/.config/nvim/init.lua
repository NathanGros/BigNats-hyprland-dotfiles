-- Leader key
vim.g.mapleader = ' '

require("config.options")

require("config.lazy")

vim.cmd.colorscheme "catppuccin-nvim"

require("config.keymaps")

-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
        vim.hl.on_yank()
    end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
    local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
    local filename = vim.api.nvim_buf_get_name(0)
    print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

-- PLUGINS
vim.pack.add({
    -- Autocompletion
    -- 'https://github.com/nvim-mini/mini.completion',
    -- Enhanced quickfix/loclist
    -- 'https://github.com/stevearc/quicker.nvim',
})
-- require('mini.completion').setup {}
-- require('quicker').setup {}
