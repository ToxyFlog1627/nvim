local M = {}

function M.use(use)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
end

function M.apply()
    require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'cpp', 'lua', 'typescript', 'vim' },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>'
            }
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner'
                }
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer'
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer'
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer'
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer'
                }
            },
            swap = {
                enable = true,
                swap_next = { ['<leader>a'] = '@parameter.inner' },
                swap_previous = { ['<leader>A'] = '@parameter.inner' }
            }
        }
    }
end

return M
