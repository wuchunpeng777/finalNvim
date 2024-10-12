return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function() 
        require("toggleterm").setup()       
        vim.keymap.set('n', '<C-t>', ':ToggleTerm direction=float<CR>',{noremap = true,silent = true})
    end
}
