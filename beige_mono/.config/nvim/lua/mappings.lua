require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>a", ":Nvdash<CR>")
map('n', '<leader>zo', require('ufo').openAllFolds, {desc = "Open all folds"})
map('n', '<leader>zc', require('ufo').closeAllFolds, {desc = "Close all folds"})
map('n', '<leader>za', "za", {desc = "Toggle fold"})
map("n", "<leader>s", ":vsp<CR>", {desc = "Split vertically"})
map("n", "<M-tab>", "<C-W><C-W>", {desc = "Switch window"})
map("n", "<tab>", ":bNext<CR>", {desc = "Switch tab"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
