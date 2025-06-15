require('keys/alias')
require('keys/plugins')

im('<C-k>', '<escape>')


-- [[ Tabs ]] --
nm('<CA-Right>', '<cmd>bnext<CR>')
vm('<CA-Right>', '<C-C>:bnext<CR>')
im('<CA-Right>', '<C-O>:bnext<CR>')
nm('<CA-Left>', '<cmd>bprevious<CR>')
vm('<CA-Left>', '<C-C>:bprevious<CR>')
im('<CA-Left>', '<C-O>:bprevious<CR>')

nm('<leader>q', '<cmd>bp<bar>sp<bar>bn<bar>bd<CR>')
vm('<leader>q', '<C-C>:bp<bar>sp<bar>bn<bar>bd<CR>')
im('<leader>q', '<C-O>:bp<bar>sp<bar>bn<bar>bd<CR>')


-- [[ Search highlight ]] --
nm('<leader>s', ':noh<CR>')
