-- Tabulations
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Gutter
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set foldcolumn=3")
vim.cmd("set signcolumn=yes")

-- Use system clipboard
vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
    ["*"] = "wl-paste --no-newline",
  },
  cache_enabled = true,
}

-- Permanent undos and redos
vim.opt.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undodir = undodir
-- Create the undo directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- Misc
vim.cmd("set cursorline")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.opt.fillchars:append({ eob = " " })
vim.o.showmode = false
vim.g.mapleader = " "
