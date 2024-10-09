return {
    "gbprod/yanky.nvim",
    opts = {
        ring = {
            storage = "shada"
        }
    },
    keys = {{
        "<leader>p",
        function()
            require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Open Yank History"
    }, {
        "y",
        "<Plug>(YankyYank)",
        mode = {"n", "x"},
        desc = "Yank text"
    }, {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = {"n", "x"},
        desc = "Put yanked text after cursor"
    }, {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = {"n", "x"},
        desc = "Put yanked text before cursor"
    }, {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = {"n", "x"},
        desc = "Put yanked text after selection"
    }, {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = {"n", "x"},
        desc = "Put yanked text before selection"
    }, {
        "<c-k>",
        "<Plug>(YankyPreviousEntry)",
        desc = "Select previous entry through yank history"
    }, {
        "<c-j>",
        "<Plug>(YankyNextEntry)",
        desc = "Select next entry through yank history"
    }}
}
