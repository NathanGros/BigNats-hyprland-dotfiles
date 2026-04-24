local map = vim.keymap.set

map("n", "<esc>", ":noh<CR>", { desc = "Clear highlights", silent = true })

map('i', "jk", '<Esc>', { silent = true })

-- Open menu on special menu key press
map({ "n", "v" }, "", function()
  vim.cmd("popup PopUp")
end, { silent = true })

-- Telescope
map({ 'n' }, '<leader>ff', ':Telescope find_files<CR>', { desc = "Find files", silent = true})
map({ 'n' }, '<leader>fw', ':Telescope live_grep<CR>', { desc = "Find word", silent = true})
map({ 'n' }, '<leader>fr', ':Telescope oldfiles<CR>', { desc = "Find recent files", silent = true})
map({ 'n' }, '<leader>f', ':Telescope<CR>', { desc = "Find with telescope", silent = true})

-- NeoTree
map({ 'n' }, '<leader>e', function()
	require("oil").open_float()
end, { desc = "Open file explorer", silent = true})

-- Multi file management
map('n', '<leader>s', ':vsp<CR>', { desc = "Open vertical split", silent = true })
map("n", "<tab>", function ()
	require('buffer_manager.ui').toggle_quick_menu()
end, { desc = "Open buffers list" })

-- LSP
map("n", "<leader>li", vim.lsp.buf.hover, { desc = "Display Information", silent = true })
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to definition", silent = true })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions", silent = true })
map("n", "<leader>le", vim.diagnostic.goto_next, { desc = "Next error", silent = true })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format file", silent = true })

-- Terminal
map("n", "<leader>t", ":terminal<CR>", { desc = "Open terminal", silent = true })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Close terminal", silent = true })
vim.keymap.set("t", "<C-\\>", [[<C-\><C-n>]])




-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
map({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
map({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
map({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
map({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
map({ 'n' }, '<A-h>', '<C-w>h')
map({ 'n' }, '<A-j>', '<C-w>j')
map({ 'n' }, '<A-k>', '<C-w>k')
map({ 'n' }, '<A-l>', '<C-w>l')

map("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment (line)" })
map("v", "<leader>/", function()
	local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
	vim.api.nvim_feedkeys(esc, "nx", false)
	require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment (visual)" })

map('t', '<Esc>', '<C-\\><C-n>')

