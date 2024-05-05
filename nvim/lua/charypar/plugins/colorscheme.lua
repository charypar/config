return { 
    "tinted-theming/base16-vim",
    priority = 1000, -- load first
    config = function()
        vim.cmd("colorscheme base16-snazzy")
        -- vim.cmd("colorscheme base16-gruvbox-dark-hard")

        -- Hide the end of buffer ~ character
        local base = vim.api.nvim_get_hl(0, { name = 'Normal' })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = base.bg, fg = base.bg })

        -- Make sure window borders are bright
        vim.api.nvim_set_hl(0, "FloatBorder", { link = "Title" })
        vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

        -- Set scope line to less bright
        vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "Comment" })
    end
}
