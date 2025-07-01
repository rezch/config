local map = require('keys/alias')

vim.g.mapleader = '\\'


-- [[ ViCom ]] --
map.all('<leader>c', ':ViComLines<CR>')


-- [[ NvimTree ]] --
map.nm('T', ':NvimTreeToggle<CR><C-w>w')
map.nm('<leader>t', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '?', require('nvim-tree.api').tree.toggle_help)


-- [[ Save ]] --
map.all('<C-S>', '<cmd>update<CR>')


-- [[ Themes ]] --
require('plugins/themes/theme_setup')
map.nm("<leader>tn", "NextTheme")
map.nm("<leader>tp", "PrevTheme")


-- [[ LSP ]] --
map.all("<leader>r", "vim.lsp.buf.rename")
map.all("<leader>f", "vim.lsp.buf.format")
map.all("<leader>a", "vim.lsp.buf.code_action")
map.all("<leader>e", "vim.diagnostic.open_float")


-- [[ Telescope ]] --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- [[ Yazi ]] --
vim.keymap.set("n", "<leader>l", function()
    require("yazi").yazi()
end)


-- [[ Signify ]] --
map.nm('<leader>d', ':SignifyHunkDiff<CR>')
map.nm('<leader>du', ':SignifyHunkUndo<CR>')
