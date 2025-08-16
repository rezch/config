local map = require('keys/alias')

vim.g.mapleader = '\\'

local all_modes = { 'n', 'v', 'i' }

-- [[ ViCom ]] --
map.all('<leader>c', ':ViComLines<CR>')

-- [[ NvimTree ]] --
map.nm('T', ':NvimTreeToggle<CR><C-w>w')
map.nm('<leader>t', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '?', require('nvim-tree.api').tree.toggle_help)

-- [[ Themes ]] --
require('plugins/themes/theme_setup')
vim.keymap.set('n', '<leader>tn', NextTheme)
vim.keymap.set('n', '<leader>tp', PrevTheme)

-- [[ LSP ]] --
vim.keymap.set(all_modes, '<leader>r', vim.lsp.buf.rename)
vim.keymap.set(all_modes, '<leader>f', vim.lsp.buf.format)
vim.keymap.set(all_modes, '<leader>a', vim.lsp.buf.code_action)
vim.keymap.set(all_modes, '<leader>e', vim.diagnostic.open_float)
vim.keymap.set(all_modes, '<leader>h', ':ClangdSwitchSourceHeader<CR>')

-- [[ Telescope ]] --
local builtin = require('telescope.builtin')
vim.keymap.set(all_modes, '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set(all_modes, '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set(all_modes, '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set(all_modes, '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- [[ Yazi ]] --
vim.keymap.set(all_modes, '<leader>l', function()
    require('yazi').yazi()
end)

-- [[ Signify ]] --
map.nm('<leader>d', ':SignifyHunkDiff<CR>')
map.nm('<leader>du', ':SignifyHunkUndo<CR>')
