return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highligt = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            ensure_installed = {
                "bash",
                "css",
                "dockerfile",
                "fish",
                "gitignore",
                "javascript",
                "json",
                "kotlin",
                "lua",
                "markdown",
                "markdown_inline",
                "rust",
                "swift",
                "tsx",
                "typescript",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    -- TODO: rethink this mapping
                    init_selection = "<leader>s",
                    node_incremental = "s",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                }
            }
        })
    end,
}
