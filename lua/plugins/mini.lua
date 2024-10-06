return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.starter').setup( -- No need to copy this inside `setup()`. Will be used automatically.
        {
            -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
            -- started with intent to show something else.
            autoopen = true,

            -- Whether to evaluate action of single active item
            evaluate_single = false,

            -- Items to be displayed. Should be an array with the following elements:
            -- - Item: table with <action>, <name>, and <section> keys.
            -- - Function: should return one of these three categories.
            -- - Array: elements of these three types (i.e. item, array, function).
            -- If `nil` (default), default items will be used (see |mini.starter|).
            items = nil,

            -- Header to be displayed before items. Converted to single string via
            -- `tostring` (use `\n` to display several lines). If function, it is
            -- evaluated first. If `nil` (default), polite greeting will be used.
            header = nil,

            -- Footer to be displayed after items. Converted to single string via
            -- `tostring` (use `\n` to display several lines). If function, it is
            -- evaluated first. If `nil` (default), default usage help will be shown.
            footer = nil,

            -- Array  of functions to be applied consecutively to initial content.
            -- Each function should take and return content for 'Starter' buffer (see
            -- |mini.starter| and |MiniStarter.content| for more details).
            content_hooks = nil,

            -- Characters to update query. Each character will have special buffer
            -- mapping overriding your global ones. Be careful to not add `:` as it
            -- allows you to go into command mode.
            query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',

            -- Whether to disable showing non-error feedback
            silent = false
        })

        require('mini.bufremove').setup()

        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [']quote
        --  - ci'  - [C]hange [I]nside [']quote
        require('mini.ai').setup {
            n_lines = 500
        }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require('mini.surround').setup()

        require('mini.files').setup({})
        vim.keymap.set('n', '<leader>fi', '<cmd>lua MiniFiles.open()<cr>', {
            desc = 'Open Mini Files'
        })

        require('mini.cursorword').setup()

        require('mini.indentscope').setup()

        require('mini.sessions').setup()
        local save_session = function()
            vim.ui.input({
                prompt = "session name: "
            }, function(input)
                if input == nil then
                    return
                end
                local mini_sessions = require('mini.sessions')
                mini_sessions.write(input)
            end)
        end

        vim.keymap.set("n", "<leader>Ss", save_session, {
            desc = "Save Session"
        })

        vim.keymap.set('n', '<leader>Sl', '<cmd>lua MiniSessions.select()<cr>', {
            desc = 'Select Session'
        })

        local delete_session = function()
            vim.ui.input({
                prompt = "session name: "
            }, function(input)
                if input == nil then
                    return
                end
                local mini_sessions = require('mini.sessions')
                mini_sessions.delete(input)
            end)
        end

        vim.keymap.set("n", "<leader>Sd", delete_session, {
            desc = "Delete Session"
        })
    end
}
