return {
    "echasnovski/mini.move",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local mini_move = require("mini.move")

        mini_move.setup({
            mappings = {
                left = "<M-left>",
                right = "<M-right>",
                down = "<M-down>",
                up = "<M-up>",

                line_left = "<M-left>",
                line_right = "<M-right>",
                line_down = "<M-down>",
                line_up = "<M-up>",
            },
        })
    end,
}
