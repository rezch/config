local map = require('keys/alias')
require('keys/plugins')

map.im('<C-k>', '<escape>')


-- [[ Tabs ]] --
map.nm('<CA-Right>', '<cmd>bnext<CR>')
map.vm('<CA-Right>', '<C-C>:bnext<CR>')
map.im('<CA-Right>', '<C-O>:bnext<CR>')
map.nm('<CA-Left>', '<cmd>bprevious<CR>')
map.vm('<CA-Left>', '<C-C>:bprevious<CR>')
map.im('<CA-Left>', '<C-O>:bprevious<CR>')

map.nm('<leader>q', '<cmd>bp<bar>sp<bar>bn<bar>bd<CR>')
map.vm('<leader>q', '<C-C>:bp<bar>sp<bar>bn<bar>bd<CR>')
map.im('<leader>q', '<C-O>:bp<bar>sp<bar>bn<bar>bd<CR>')

-- [[ Search highlight ]] --
map.nm('<leader>s', ':noh<CR>')
