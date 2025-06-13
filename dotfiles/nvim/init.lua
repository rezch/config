require('plugins/packer_install')
require('plugins/themes/theme_setup')

require('base/search')
require('base/tabs')
require('base/other')

require('keys/main')

set_theme('witchesbrew')

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd([[
    autocmd filetype cpp inoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++20 -DUwU '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++20 -DUwU '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>

    autocmd filetype sh inoremap <F5> <Esc> :w <bar> exec '!bash '.shellescape('%')<CR>
    autocmd filetype sh nnoremap <F5> <Esc> :w <bar> exec '!bash '.shellescape('%')<CR>
]])

vim.cmd([[
    set list
    set lcs+=space:·
]])
