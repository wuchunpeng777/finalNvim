return {
    'romgrk/barbar.nvim',
    dependencies = {'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false

        vim.keymap.set('n', ']b', '<cmd>BufferNext<cr>', {
            desc = 'Next Buffer'
        })
        vim.keymap.set('n', '[b', '<cmd>BufferPrevious<cr>', {
            desc = 'Previous Buffer'
        })

        vim.keymap.set('n', '<b', '<cmd>BufferMovePrevious<cr>', {
            desc = 'Move Buffer Previous'
        })
        vim.keymap.set('n', '>b', '<cmd>BufferMoveNext<cr>', {
            desc = 'Move Buffer Next'
        })
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
}
