return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { desc = "Fuzzy find a buffer" })
        keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", { desc = "Find text in cwd" })
        keymap.set("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = "Find text under cursor in cwd" })
        keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { desc = "Find in help" })
        keymap.set("n", "<leader>ft", ":TodoTelescope<cr>", { desc = "Find TODOs" })
    end,
}
