return {
    {
        'maxmx03/fluoromachine.nvim',
        lazy = false,
        priority = 1000,
        config = function ()
         local fm = require 'fluoromachine'

         fm.setup {
            glow = false,
            theme = 'retrowave', -- fluoromachine
            transparent = false,
         }

         -- vim.cmd.colorscheme 'fluoromachine'
        end
    }
}
