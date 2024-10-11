-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

vim.g.neovide_scroll_animation_length = 0.3

vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣'
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {
    desc = "ClearSearch"
})


vim.o.autoread = true
vim.bo.autoread = true

if vim.fn.has "win32" == 1 then
    vim.o.guifont = "Maple Mono NF CN:h12"
elseif vim.fn.has "mac" == 1 then
    vim.o.guifont = "Maple Mono NF CN:h16"
end


vim.keymap.set('n', '<leader>n', '<cmd>enew<CR>', {
    desc = "NewBuffer"
})

vim.keymap.set("n", "<leader>qq", "<cmd>qa!<CR>", {
    desc = "Quit All"
})

vim.opt.sessionoptions:append 'globals'

vim.env.OPENAI_API_KEY = "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"