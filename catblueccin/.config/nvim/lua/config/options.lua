---@diagnostic disable: undefined-global
vim.o.autoindent = true
vim.o.expandtab = false
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.tabstop = 4

vim.o.fillchars = "foldopen:,foldclose:"
vim.o.foldcolumn = "1"
vim.o.foldmethod = "indent"
-- vim.o.foldmethod = "syntax"
vim.o.foldnestmax = 1
vim.o.foldenable = false

vim.o.list = true
vim.o.listchars = "tab:│ ,leadmultispace:│   ,trail:-,extends:󰄾,precedes:󰄽,nbsp:+"

vim.o.number = true
vim.o.signcolumn = "number"

vim.o.spell = false
vim.o.spellfile = "~/.config/nvim/spellfile.utf-8.add"
vim.o.spelllang = "en,fr"
vim.o.spelloptions = "camel,noplainbuffer"

vim.o.background = "dark"
vim.o.confirm = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.linebreak = true
vim.o.pumborder = "rounded"
-- vim.o.relativeNumber = false
vim.o.report = 1
vim.o.scrolloff = 10
vim.opt.showmode = false
vim.o.sidescrolloff = 3
vim.o.smartcase = true
vim.o.splitright = true
vim.o.tildeop = true
vim.o.title = true
vim.o.undofile = true
vim.o.virtualedit = "block"
vim.o.whichwrap = "b,s,<,>"
vim.o.winborder = "rounded"
vim.o.wrap = false

-- Sync clipboard between OS and Neovim.
vim.api.nvim_create_autocmd('UIEnter', {
    callback = function()
        vim.o.clipboard = 'unnamedplus'
    end,
})
