local M = {}

-- Available arguments:
-- $filePath
-- $fileBasePath
-- $fileBase
-- $dir

-- Supported languages:
-- lua, c, bash, ~html, ~java, python, ocaml
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
	java = {
		-- current = "javac $filePath && java -cp $dir $fileBasePath",
        main = "mvn clean package && mvn exec:java"
		-- main = "cd $dir && javac *.java && java Main",
		-- main = "javac *.java && java Main",
	},
	py = {
		current = "python3 $filePath",
	},
	ml = {
		current = "ocaml $filePath",
		main = "eval $(opam env) && dune build && $dir/_build/default/$fileBase.exe",
	},
}

return M
