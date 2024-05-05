return {
    "hedyhli/outline.nvim",
    config = function()
        vim.keymap.set("n", "<leader>eo", "<cmd>Outline<CR>", { desc = "Toggle Code Outline" })

        require("outline").setup({
            -- Your setup opts here (leave empty to use defaults)
        })
    end,
}
