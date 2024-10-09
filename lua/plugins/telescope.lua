return {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim',
                    { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        -- build = 'make',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
            return vim.fn.executable 'make' == 1
        end
    }},
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
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "ignore_case" -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            }
        })

        pcall(require('telescope').load_extension, 'fzf')

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
        vim.keymap.set('n', 'gu', builtin.lsp_references, {
            desc = 'Telescope LSP references'
        })
    end
}
