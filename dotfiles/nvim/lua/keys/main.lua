require('keys/alias')
require('keys/plugins')

im('<C-k>', '<escape>')


-- [[ Tabs ]] --
nm('<C-S-Right>', ':<C-U>tabprevious<CR>')
im('<C-S-Right>', '<C-\\><C-N>:tabprevious<CR>')
vm('<C-S-Right>', '<C-C>:tabprevious<CR>')
nm('<C-S-Left>', ':<C-U>tabnext<CR>')
im('<C-S-Left>', '<C-\\><C-N>:tabnext<CR>')
vm('<C-S-Left>', '<C-C>:tabnext<CR>')

nm('<leader>q', ':<C-u>tabclose<CR>')
im('<leader>q', '<C-\\><C-n>:tabclose<CR>')
vm('<leader>q', '<C-c>:tabclose<CR>')


-- [[ Search highlight ]] --
nm('<leader>s', ':noh<CR>')

