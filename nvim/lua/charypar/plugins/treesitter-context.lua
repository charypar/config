return {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local ts_context = require("treesitter-context")

        ts_context.setup({
            max_lines = 5,
        })
    end,
}
