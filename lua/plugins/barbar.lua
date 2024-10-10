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

        vim.keymap.set('n', '<leader>bp', '<cmd>BufferPin<cr>', {
            desc = 'Pin Buffer'
        })
        vim.keymap.set('n', '<leader>bc', '<cmd>BufferCloseAllButCurrent<cr>', {
            desc = 'Close All But Current Buffer'
        })

        vim.keymap.set('n', '<leader>bl', '<cmd>BufferCloseBuffersLeft<cr>', {
            desc = 'Close All Left Buffers'
        })
        vim.keymap.set('n', '<leader>br', '<cmd>BufferCloseBuffersRight<cr>', {
            desc = 'Close All Right Buffers'
        })

        vim.keymap.set('n', '<leader>c', '<cmd>BufferClose<cr>', {
            desc = 'Close Buffer'
        })

        vim.keymap.set('n', '<leader>bb', '<cmd>BufferPick<cr>', {
            desc = 'Pick Buffer'
        })

        vim.keymap.set('n', '<leader>bd', '<cmd>BufferPickDelete<cr>', {
            desc = 'Pick Buffer Delete'
        })
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
        icons = {
            pinned = {
                button = '',
                filename = true
            }
        },
        sidebar_filetypes = {
			['neo-tree'] = true
		}
    }
}
