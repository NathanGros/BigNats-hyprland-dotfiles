return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "ts_ls", "html", "cssls", "ruff", "jdtls", "ocamllsp" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.diagnostic.config({
                virtual_text = {
                    spacing = 2,
                    prefix = function(diagnostic)
                        local icons = {
                            [vim.diagnostic.severity.ERROR] = " ",
                            [vim.diagnostic.severity.WARN] = " ",
                            [vim.diagnostic.severity.INFO] = " ",
                            [vim.diagnostic.severity.HINT] = " ",
                        }
                        return icons[diagnostic.severity] or "●"
                    end,
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.ruff.setup({
                capabilities = capabilities,
            })
            lspconfig.jdtls.setup({
                capabilities = capabilities,
            })
            lspconfig.ocamllsp.setup({
                capabilities = capabilities,
            })
        end,
    },
}
