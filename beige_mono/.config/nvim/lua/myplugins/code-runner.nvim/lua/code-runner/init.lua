local M = {}

local config = require("code-runner.config")

local function merge_tables(defaults, overrides)
	local result = vim.deepcopy(defaults)
	for k, v in pairs(overrides) do
		if type(v) == "table" and type(result[k]) == "table" then
			result[k] = merge_tables(result[k], v)
		else
			result[k] = v
		end
	end
	return result
end

function M.setup(opts)
	opts = opts or {}
	if opts.commands then
		config.commands = merge_tables(config.commands, opts.commands)
	end
end

vim.api.nvim_create_user_command("CodeRunner", function()
	require("code-runner.runner").run("current", config)
end, {})

vim.api.nvim_create_user_command("CodeRunnerMain", function()
	require("code-runner.runner").run("main", config)
end, {})

return M
