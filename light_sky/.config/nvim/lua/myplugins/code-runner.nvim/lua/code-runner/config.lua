local M = {}

-- Available arguments:
-- $filePath     : full file path
-- $fileBasePath : full file path without the extension
-- $fileBase     : file name without extension
-- $dir          : full directory path

-- Supported languages by default:
-- lua, c, bash, html, python, ocaml
M.commands = {
    lua = {
        current = "lua $filePath",
    },
    c = {
        current = "gcc $filePath -o $fileBasePath.exe && $fileBasePath.exe",
        main = "cd $dir && make", -- assume Makefile in same dir
    },
    sh = {
        current = "bash $filePath",
    },
    html = {
        current = "xdg-open $filePath",
    },
    py = {
        current = "python3 $filePath",
    },
    ml = {
        current = "ocaml $filePath",
        main = "eval $(opam env) && dune build && $dir/_build/default/$fileBase.exe",
    },
    java = {
        current = "java $filePath"
    }
}

return M
