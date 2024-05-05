return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        local comment = require("Comment")

        local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

        ---@diagnostic disable-next-line: missing-fields
        comment.setup({
            pre_hook = ts_context_commentstring.create_pre_hook(),
            toggler = {
                line = '<leader>cc',
                block = '<leader>bb',
            },
            opleader = {
                ---Line-comment keymap
                line = '<leader>c',
                ---Block-comment keymap
                block = '<leader>b',
            },
            extra = {
                ---Add comment on the line above
                above = '<leader>cO',
                ---Add comment on the line below
                below = '<leader>co',
                ---Add comment at the end of line
                eol = '<leader>cA',
            },
            mappings = {
                basic = true,
                extra = true,
            }
        })
    end
}
