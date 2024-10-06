return{
    'andrew-george/telescope-themes',
    config = function()
        require('telescope').load_extension('themes')

        vim.keymap.set('n', '<leader>ft', ':Telescope themes<CR>', {
            desc = 'Telescope themes',
            silent = true
        })
    end
}