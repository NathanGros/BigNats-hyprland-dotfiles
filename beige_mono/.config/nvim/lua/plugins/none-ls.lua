return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.luacheck,
                -- C
                null_ls.builtins.formatting.clang_format,
                -- Javascript/Typescript
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.eslint_d,
                -- HTML
                null_ls.builtins.diagnostics.htmlhint,
                -- CSS
                null_ls.builtins.diagnostics.stylelint,
                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.ruff,
                -- Java
                null_ls.builtins.formatting.google_java_format,
                null_ls.builtins.diagnostics.checkstyle,
                -- OCaml
                null_ls.builtins.formatting.ocamlformat,
                -- null_ls.builtins.diagnostics.ocamllsp,
            },
        })
    end,
}
