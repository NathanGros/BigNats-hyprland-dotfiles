local M = {}

function M.setup() end

vim.api.nvim_create_user_command("CodeRunner", function()
    require("code-runner.runner").run("current")
end, {})

vim.api.nvim_create_user_command("CodeRunnerMain", function()
    require("code-runner.runner").run("main")
end, {})

return M
