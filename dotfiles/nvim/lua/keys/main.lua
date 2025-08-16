local map = require('keys/alias')
local utils = require('base/utils')
require('keys/plugins')

map.im('<C-k>', '<escape>')

-- [[ Tabs ]] --
local key  = utils.os() == 'OSX' and 'CA' or 'C'
map.nm('<'..key..'-Right>', '<cmd>bnext<CR>')
map.vm('<'..key..'-Right>', '<C-C>:bnext<CR>')
map.im('<'..key..'-Right>', '<C-O>:bnext<CR>')
map.nm('<'..key..'-Left>', '<cmd>bprevious<CR>')
map.vm('<'..key..'-Left>', '<C-C>:bprevious<CR>')
map.im('<'..key..'-Left>', '<C-O>:bprevious<CR>')

local close_one_buf = ':bp<bar>sp<bar>bn<bar>bd!<CR>'
map.nm('<leader>q', close_one_buf)
map.vm('<leader>q', '<C-C>' .. close_one_buf)
map.im('<leader>q', '<C-O>' .. close_one_buf)

-- [[ Search highlight ]] --
map.nm('<leader>s', ':noh<CR>')

-- [[ Save ]] --
map.all('<C-S>', '<cmd>update<CR>')

-- [[ Terminal ]] --
vim.api.nvim_set_keymap('t', '<Leader><ESC>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<Leader>q', '<C-\\><C-n>' .. close_one_buf, { noremap = true })
