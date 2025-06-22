require('plugins/packer_install')

require('base/search')
require('base/tabs')
require('base/other')

require('keys/main')

local theme_config = require('plugins/themes/theme_setup')
theme_config(3)

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd([[
    autocmd filetype cpp inoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++2b -DUwU '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++2b -DUwU '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>

    autocmd filetype sh inoremap <F5> <Esc> :w <bar> exec '!bash '.shellescape('%')<CR>
    autocmd filetype sh nnoremap <F5> <Esc> :w <bar> exec '!bash '.shellescape('%')<CR>

    autocmd filetype php inoremap <F5> <Esc> :w <bar> exec '!php '.shellescape('%')<CR>
    autocmd filetype php nnoremap <F5> <Esc> :w <bar> exec '!php '.shellescape('%')<CR>
]])

vim.cmd([[
    set list
    set lcs+=lead:·
    set lcs+=multispace:·
    set lcs+=trail:·
]])
