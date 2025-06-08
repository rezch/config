require('plugins/packer_install')

require('base/search')
require('base/tabs')
require('base/other')

require('keys/main')

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd([[
    set background=dark
    set termguicolors
    colorscheme zenburned " catppuccin
    hi Normal guibg=NONE ctermbg=NONE
]])

vim.cmd([[
let g:clipboard = {
    \ 'name': 'xsel',
    \ 'copy': {
    \     '+': 'xsel -ib',
    \     '*': 'xsel -ip'
    \ },
    \ 'paste': {
    \     '+': 'xsel -ob',
    \     '*': 'xsel -op'
    \ },
    \ 'cache_enabled': 1
    \ }
]])


vim.cmd([[
    autocmd filetype cpp inoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++20 -DUwU '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++20 -DUwU '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
]])

vim.cmd([[
    set list
    set lcs+=space:·
]])
