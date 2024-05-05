return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

        local neotree = require("neo-tree")

        vim.g.loaded_netrw = 1
        vim.g.lodaed_netrwPlugin = 1

        neotree.setup({
            close_if_last_window = true,
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = "✖", -- this can only be used in the git_status source
                        renamed = "󰁕", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
        })

        -- keymaps
        local keymap = vim.keymap

        keymap.set("n", "<leader>ee", ":Neotree<CR>", { desc = "Open file explorer" })
        keymap.set("n", "<leader>ef", ":Neotree reveal<CR>", { desc = "Open file explorer on current file" })
        keymap.set("n", "<leader>ec", ":Neotree close<CR>", { desc = "Close file explorer" })
    end,
}
