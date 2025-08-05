local Terminal = require("toggleterm.terminal").Terminal
local runner_term = nil

local M = {}

function M.get_term()
    if not runner_term then
        runner_term = Terminal:new({
            direction = "horizontal",
            display_name = "CodeRunner",
            count = 99,
        })
    end
    return runner_term
end

return M
