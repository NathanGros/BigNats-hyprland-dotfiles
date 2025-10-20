local M = {}
local runterminal = require("code-runner.runterminal")

-- Expand variables in the command
local function substitute(cmd)
	cmd = cmd:gsub("$fileBase", vim.fn.expand("%:t:r"))
	cmd = cmd:gsub("$filePathBase", vim.fn.expand("%:p:r"))
	cmd = cmd:gsub("$filePath", vim.fn.expand("%:p"))
	cmd = cmd:gsub("$dir", vim.fn.expand("%:p:h"))
	return cmd
end

function M.run(mode, config)
	local term = runterminal.get_term()
	if term:is_open() then
		term:close()
	else
		local ext = vim.fn.expand("%:e")
		local commands = config.commands[ext]
		if not commands then
			return vim.notify(
				'Unsupported running for filetype "' .. ext .. '"',
				vim.log.levels.ERROR,
				{ title = "CodeRunner" }
			)
		end
		local extcommand = nil
		if mode == "current" then
			extcommand = commands.current
			if not extcommand then
				return vim.notify(
					'Unsupported current file running for filetype "' .. ext .. '"',
					vim.log.levels.ERROR,
					{ title = "CodeRunner" }
				)
			end
		else
			extcommand = commands.main
			if not extcommand then
				return vim.notify(
					'Unsupported main running for filetype "' .. ext .. '"',
					vim.log.levels.ERROR,
					{ title = "CodeRunner" }
				)
			end
		end
		local cmd = substitute(extcommand)
		term:open()
		term:send(cmd, true)
	end
end

return M
