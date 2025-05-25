-- require('keys/plugins')

vim.g.mapleader = '\\'


-- [[ ViCom ]] --
nm('<leader>c', ':ViComLines<CR>')
vm('<leader>c', '<C-S>:ViComLines<CR>')
im('<leader>c', '<C-O>:ViComLines<CR>')


-- [[ Neotree ]] --
nm('T', ':Neotree toggle<CR><C-w>w')


-- [[ Save ]] --
nm('<C-S>', '<cmd>update<CR>')
vm('<C-S>', '<C-C>:update<CR>')
im('<C-S>', '<C-O>:update<CR>')
