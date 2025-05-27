vim.g.mapleader = '\\'


-- [[ ViCom ]] --
nm('<leader>c', ':ViComLines<CR>')
vm('<leader>c', '<C-S>:ViComLines<CR>')
im('<leader>c', '<C-O>:ViComLines<CR>')


-- [[ NvimTree ]] --
nm('T', ':NvimTreeToggle<CR><C-w>w')
nm('<leader>t', ':NvimTreeFocus<CR>')


-- [[ Save ]] --
nm('<C-S>', '<cmd>update<CR>')
vm('<C-S>', '<C-C>:update<CR>')
im('<C-S>', '<C-O>:update<CR>')
