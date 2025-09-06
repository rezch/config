require('plugins/packer_install')

require('base/other')
require('keys/main')

require('plugins/themes/theme_setup').setup({
    themes = {
        'kanagawa',
        'rosebones',
        'seoulbones',
        'duckbones',
        'neobones',
        'nordbones',
        'vesper',
        'base16-black-metal-venom',
        'base16-black-metal',
        'zenbones',
        'kanagawa-dragon',
        'everforest',
    },
    transparent = false,
    bg_color = '#070707',
    current_theme = 1,
})

vim.cmd([[
    " cpp
    autocmd filetype cpp inoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++2b -DUwU -O2 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++2b -DUwU -O2 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>

    " c
    autocmd filetype c inoremap <F5> <Esc> :w <bar> exec '!gcc -DUwU -O2 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
    autocmd filetype c nnoremap <F5> <Esc> :w <bar> exec '!gcc -DUwU -O2 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>

    " sh
    autocmd filetype sh inoremap <F5> <Esc> :w <bar> exec '!bash '.shellescape('%')<CR>
    autocmd filetype sh nnoremap <F5> <Esc> :w <bar> exec '!bash '.shellescape('%')<CR>

    " php
    autocmd filetype php inoremap <F5> <Esc> :w <bar> exec '!php '.shellescape('%')<CR>
    autocmd filetype php nnoremap <F5> <Esc> :w <bar> exec '!php '.shellescape('%')<CR>
]])
