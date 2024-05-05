return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    config = function()
        local wk = require("which-key")

        wk.register({
            ["<leader>"] = {
                c = { name = "+Code actions" },
                d = { name = "+Show diagnostics" },
                e = { name = "+Explore current directory" },
                f = { name = "+Fuzzy find" },
                -- FIXME: this label doesn't show up, probably because mappings only get added
                -- in ./gitsigns.lua
                h = { name = "+Version history" },
                w = { name = "+Window management" },
            },
        })

        wk.setup({
            window = {
                border = "rounded",
            },
        })
    end,
}
