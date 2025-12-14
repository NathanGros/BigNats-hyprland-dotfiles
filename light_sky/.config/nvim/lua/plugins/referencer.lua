return {
    "romus204/referencer.nvim",
    config = function()
        require("referencer").setup({
            enable = true,                       -- enable after LSP attach
            format = "   %d usages",            -- format string for reference count
            show_no_reference = false,           -- show if refs count = 0
            kinds = { 5, 6, 7, 8, 9, 10, 11, 12, 13, 22, 23, }, -- LSP SymbolKinds to show references for
            hl_group = "Comment",                -- default highlight group
            color = nil,                         -- optional custom color (overrides hl_group)
            virt_text_pos = "eol",               -- virtual text position (eol | overlay | right_align)
            pattern = nil,                       -- pattern for LspAttach autocmd to auto-enable
            lsp_servers = {}                     -- list of servers for which this plugin will be active. nil or {} is ALL LSP clients
        })
    end,
}
