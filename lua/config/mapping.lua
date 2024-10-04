local wk = require("which-key")
wk.add({
 {
      mode = { "n"},
      { "<leader>n", "<cmd>enew<CR>", desc = "NewBuffer" },
    }
  })