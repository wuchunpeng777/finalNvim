return {{
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
        -- add any opts hereby
        provider = "openai",
        openai = {
            endpoint = "https://openrouter.ai/api/v1",
            model = "anthropic/claude-3.5-sonnet",
            temperature = 0,
        }
    },
    dependencies = {"nvim-tree/nvim-web-devicons", "stevearc/dressing.nvim", "nvim-lua/plenary.nvim",
                    "MunifTanjim/nui.nvim",
    --- The below is optional, make sure to setup it properly if you have lazy=true
                    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            file_types = {"markdown", "Avante"}
        },
        ft = {"markdown", "Avante"}
    }}
}}

