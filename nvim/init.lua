vim.cmd 'packadd! nohlsearch'
local gh = function(repo) return 'https://github.com/' .. repo; end
vim.pack.add({
    { src = gh('nvim-mini/mini.nvim'), version = 'stable' },
    { src = gh('NotAShelf/direnv.nvim') },
    { src = gh('neovim/nvim-lspconfig') },
    { src = gh('lervag/vimtex') },
})

require('direnv').setup({ autoload_direnv = true })
require('mini.ai').setup()
require('mini.sessions').setup({ autoread = true })
require('mini.surround').setup()
require('mini.pairs').setup()
require('mini.completion').setup()
require('mini.icons').setup({ style = 'ascii' })
require('mini.statusline').setup({ icons = false })

local err, background, foreground = pcall(require, 'colors')
require('mini.hues').setup({
    background = err and background or '#111318',
    foreground = err and foreground or '#e1e2e9'
})

-- Global Options
vim.g.mapleader = ','
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.netrw_banner = 0

-- Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.exrc = true
vim.wo.list = true

-- Mappings
vim.keymap.set('n', '<Leader>c', ':cd %:h<CR>', {
    remap = false,
    desc = "CD to current file's directory"
})
vim.keymap.set('!', '<C-BS>', '<C-W>')
