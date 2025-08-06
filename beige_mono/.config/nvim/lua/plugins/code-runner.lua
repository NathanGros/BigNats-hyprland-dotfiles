return {
    dir = vim.fn.stdpath("config") .. "/lua/myplugins/code-runner.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
        require("code-runner").setup({
            commands = {
                -- Available arguments:
                -- $filePath     : full file path
                -- $fileBasePath : full file path without the extension
                -- $fileBase     : file name without extension
                -- $dir          : full directory path

                -- Supported languages by default:
                -- lua, c, bash, html, python, ocaml

                -- Example
                -- c = {
                -- 	current = "gcc $filePath -o $fileBasePath.exe && $fileBasePath.exe",
                -- 	main = "cd $dir && make", -- assume Makefile in same dir
                -- },

                java = {
                    -- current = "javac $filePath && java -cp $dir $fileBasePath",
                    main = "mvn clean package && mvn exec:java",
                    -- main = "cd $dir && javac *.java && java Main",
                    -- main = "javac *.java && java Main",
                },
                rust = {
                    main = "cargo run",
                },
            },
        })
    end,
}
