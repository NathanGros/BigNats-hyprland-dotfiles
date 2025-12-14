return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    config = function()
        require('gitblame').setup({
            enabled = false,
            message_template = "   <author> • <date> • <summary>",
            date_format = "%m-%d-%Y %H:%M:%S",
            delay = 500,
            max_commit_summary_length = 30,
        })
    end,
}
