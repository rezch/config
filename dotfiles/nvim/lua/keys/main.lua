require('keys/alias')
require('keys/plugins')

im('<C-k>', '<escape>')


-- [[ Tabs ]] --
nm('<C-Right>', '<cmd>bnext<CR>')
vm('<C-Right>', '<C-C>:bnext<CR>')
im('<C-Right>', '<C-O>:bnext<CR>')
nm('<C-Left>', '<cmd>bprevious<CR>')
vm('<C-Left>', '<C-C>:bprevious<CR>')
im('<C-Left>', '<C-O>:bprevious<CR>')

nm('<leader>q', '<cmd>bp<bar>sp<bar>bn<bar>bd<CR>')
vm('<leader>q', '<C-C>:bp<bar>sp<bar>bn<bar>bd<CR>')
im('<leader>q', '<C-O>:bp<bar>sp<bar>bn<bar>bd<CR>')


-- [[ Search highlight ]] --
nm('<leader>s', ':noh<CR>')
