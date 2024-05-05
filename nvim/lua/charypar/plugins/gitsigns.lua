return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup()
    end,
}
