require('keys/alias')
require('keys/plugins')

im('<C-k>', '<escape>')


-- [[ Tabs ]] --
nm('<C-S-Right>', ':<C-U>tabnext<CR>')
im('<C-S-Right>', '<C-\\><C-N>:tabnext<CR>')
vm('<C-S-Right>', '<C-C>:tabnext<CR>')
nm('<C-S-Left>', ':<C-U>tabprevious<CR>')
im('<C-S-Left>', '<C-\\><C-N>:tabprevious<CR>')
vm('<C-S-Left>', '<C-C>:tabprevious<CR>')

nm('<leader>q', ':<C-U>tabclose<CR>')
im('<leader>q', '<C-\\><C-N>:tabclose<CR>')
vm('<leader>q', '<C-C>:tabclose<CR>')

