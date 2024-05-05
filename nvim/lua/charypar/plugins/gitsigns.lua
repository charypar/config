return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufReadPost", "BufWritePost", "BufNewFile" },
    config = function()
        local gs = require("gitsigns")

        gs.setup({
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text_pos = "right_align",
                delay = 200,
            },
            on_attach = function(bufnr)
                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                map("n", "<leader>hb", function()
                    gs.blame_line({ full = true })
                end, "Blame current line")
                map("n", "<leader>hd", gs.diffthis, "Diff this")
                map("n", "<leader>hD", function()
                    gs.diffthis("~")
                end, "Diff this ~")
            end,
        })
    end,
}
