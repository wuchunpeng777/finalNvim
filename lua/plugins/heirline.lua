return{
    "rebelot/heirline.nvim",
    config = function()
        require("heirline").setup({
            statusline = {},
            winbar = {},
            tabline = {},
            statuscolumn = {},
        })
    end
}