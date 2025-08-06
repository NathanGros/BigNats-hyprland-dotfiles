-- Tabulations
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Gutter
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set signcolumn=yes")

-- Folds
vim.o.foldcolumn = "1"
vim.o.fillchars = [[fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Permanent undos and redos
vim.opt.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undodir = undodir
-- Create the undo directory if it doesn't exist
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- Misc
vim.cmd("set hidden")
vim.cmd("set cursorline")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.opt.fillchars:append({ eob = " " })
vim.opt.fillchars:append({ vert = "┃" })
vim.o.showmode = false
vim.g.mapleader = " "

-- Use system clipboard
if vim.fn.has("unix") == 1 then
	if os.getenv("WAYLAND_DISPLAY") then
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
	elseif os.getenv("DISPLAY") then
		vim.g.clipboard = {
			name = "xclip",
			copy = {
				["+"] = "xclip -selection clipboard",
				["*"] = "xclip -selection primary",
			},
			paste = {
				["+"] = "xclip -selection clipboard -o",
				["*"] = "xclip -selection primary -o",
			},
			cache_enabled = true,
		}
	end
end
