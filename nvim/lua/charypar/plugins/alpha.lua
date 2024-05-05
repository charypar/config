return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local section = dashboard.section
        local fn = vim.fn
        local config = dashboard.config

        local marginTopPercent = 0.2
        local headerPadding = fn.max({2, fn.floor(fn.winheight(0) * marginTopPercent) })

        -- Set up layout
        config.layout = {
            { type = 'padding', val = headerPadding },
            section.header,
            { type = 'padding', val = 5 },
            section.buttons,
            section.footer,
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
            dashboard.button("SPC fr", "  > Open Recent", "<cmd>Telescope oldfiles<CR>"),
            dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
            -- dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
            dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
        }

        alpha.setup(dashboard.config)
    end
};
