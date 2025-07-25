local map = vim.keymap.set

map("n", "<esc>", ":noh<CR>", { desc = "Clear highlights" })

-- Alpha dashboard
map("n", "<leader>a", ":Alpha<CR>", { desc = "Open dashboard"})

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Telescope find files" })
map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Telescope find recent files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Telescope live grep" })

-- NeoTree
map("n", "<leader>e", ":Neotree reveal<CR>", { desc = "Focus Neotree" })
map("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle Neotree" })

-- FineCmdLine
map("n", ":", "<cmd>FineCmdline<CR>", { noremap = true }, { desc = "Open command line" })
map("n", ";", "<cmd>FineCmdline<CR>", { noremap = true }, { desc = "Open command line" })

-- System clipboard
map("n", "y", '"+y', { noremap = true })
map("n", "yy", '"+yy', { noremap = true })
map("n", "p", '"+p', { noremap = true })
map("n", "P", '"+P', { noremap = true })
map("n", "d", '"+d', { noremap = true })
map("n", "x", '"+x', { noremap = true })
map("n", "c", '"+c', { noremap = true })
map("v", "y", '"+y', { noremap = true })
map("v", "p", '"+p', { noremap = true })
map("v", "d", '"+d', { noremap = true })
map("v", "x", '"+x', { noremap = true })
map("v", "c", '"+c', { noremap = true })

-- LSP
map("n", "K", vim.lsp.buf.hover, { desc = "Display Information" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Formatters
map("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })

-- Comments
map("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (line)" })

map("v", "<leader>/", function()
	local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
	vim.api.nvim_feedkeys(esc, "nx", false)
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (visual)" })

-- BufferLine
map("n", "<tab>", ":BufferLineCycleNext<CR>", { desc = "Go to next tab" })
map("n", "<S-tab>", ":BufferLineCyclePrev<CR>", { desc = "Go to previous tab" })
local bufdelete = require('snacks.bufdelete').delete
map('n', '<leader>x', function()
  bufdelete(0)  -- 0 means current buffer
end, { desc = "Close tab" })
