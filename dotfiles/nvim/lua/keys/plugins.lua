vim.g.mapleader = '\\'


-- [[ ViCom ]] --
nm('<leader>c', ':ViComLines<CR>')
vm('<leader>c', '<C-S>:ViComLines<CR>')
im('<leader>c', '<C-O>:ViComLines<CR>')


-- [[ NvimTree ]] --
nm('T', ':NvimTreeToggle<CR><C-w>w')
nm('<leader>t', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '?', require('nvim-tree.api').tree.toggle_help)


-- [[ Save ]] --
nm('<C-S>', '<cmd>update<CR>')
vm('<C-S>', '<C-C>:update<CR>')
im('<C-S>', '<C-O>:update<CR>')


-- [[ Themes ]] --
local themes_setup = require('plugins/themes/theme_setup')
vim.keymap.set("n", "<leader>tn", NextTheme)
vim.keymap.set("n", "<leader>tp", PrevTheme)


-- [[ LSP ]] --
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)


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
nm('<leader>d', ':SignifyHunkDiff<CR>')
nm('<leader>du', ':SignifyHunkUndo<CR>')
