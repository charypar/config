return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local dressing = require("dressing")

        dressing.setup({
            enabled = true,
            border = "rounded",

            select = {
                telescope = require("telescope.themes").get_cursor(),
            }
        })
    end,
}
