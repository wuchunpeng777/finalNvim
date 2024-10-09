-- todo
return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    opts = {
        provider = "anthropic",
        vendors = {
            ['anthropic'] = {
                api_key_name = "ANTHROPIC_API_KEY",
                endpoint = "https://openrouter.ai/api/v1",
                module = 'anthropic/claude-3.5-sonnet',
                parse_curl_args = function(opts, code_opts)
                    return {
                        url = opts.endpoint,
                        headers = {
                            ["Accept"] = "application/json",
                            ["Content-Type"] = "application/json",
                            ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name)
                        },
                        body = {
                            model = opts.model,
                            messages = { -- you can make your own message, but this is very advanced
                            {
                                role = "system",
                                content = code_opts.system_prompt
                            }, {
                                role = "user",
                                content = require("avante.providers.openai").get_user_message(code_opts)
                            }},
                            temperature = 0,
                            max_tokens = 4096,
                            stream = true -- this will be set by default.
                        }
                    }
                end,
                parse_response_data = function(data_stream, event_state, opts)
                    require("avante.providers").openai.parse_response(data_stream, event_state, opts)
                end
            }
        }
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- build = "make",
    build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows
    dependencies = {"nvim-treesitter/nvim-treesitter", "stevearc/dressing.nvim", "nvim-lua/plenary.nvim",
                    "MunifTanjim/nui.nvim", --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            -- recommended settings
            default = {
                embed_image_as_base64 = false,
                prompt_for_file_name = false,
                drag_and_drop = {
                    insert_mode = true
                },
                -- required for Windows users
                use_absolute_path = true
            }
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = {"markdown", "Avante"}
            },
            ft = {"markdown", "Avante"}
        }
    }}
}
