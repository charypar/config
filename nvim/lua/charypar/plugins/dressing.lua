return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local dressing = require("dressing")

        dressing.setup({
            enabled = true,
            border = "rounded",
        })
    end,
}
