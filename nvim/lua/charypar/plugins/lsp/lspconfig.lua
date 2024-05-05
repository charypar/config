return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings
                -- See :help vim.lsp.*
                local opts = { buffer = ev.buf, silent = true }

                -- keybinds
                opts.desc = "Find LSP type definitions"
                keymap.set("n", "fs", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)

                opts.desc = "Show LSP references"
                keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)

                opts.desc = "Code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Rename"
                keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

                opts.desc = "Show line diagnostic"
                keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)

                opts.desc = "Show diagnostics"
                keymap.set("n", "<leader>cD", "<cmd>Telescope diagnostics bfnr=0<cr>", opts)

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "gp", vim.diagnostic.goto_next, opts)

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "gP", vim.diagnostic.goto_prev, opts)

                opts.desc = "Show details for word under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<cr>", opts)
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
        })
    end,
}
