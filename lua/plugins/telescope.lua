return {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous
                    },
                    n = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous
                    }
                }
            }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {
            desc = 'Telescope find files'
        })
        vim.keymap.set('n', '<leader>fw', builtin.live_grep, {
            desc = 'Telescope live grep'
        })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {
            desc = 'Telescope buffers'
        })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {
            desc = 'Telescope oldfiles'
        })
        vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {
            desc = 'Telescope LSP symbols'
        })
        vim.keymap.set('n', '<leader>lG', builtin.lsp_workspace_symbols, {
            desc = 'Telescope LSP workspace symbols'
        })
    end
}
