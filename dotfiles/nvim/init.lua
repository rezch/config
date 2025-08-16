require('plugins/packer_install')

require('base/other')
require('keys/main')

require('plugins/themes/theme_setup').setup({
    themes = {
        'kanagawa-dragon',
        'vesper',
        'base16-black-metal',
        'kanagawa',
        'everforest',
    },
    transparent = false,
    current_theme = 1,
})

vim.cmd([[
    autocmd filetype cpp inoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++2b -DUwU -O2 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>
    autocmd filetype cpp nnoremap <F5> <Esc> :w <bar> exec '!g++ -std=c++2b -DUwU -O2 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' && rm '.shellescape('%:r')<CR>

    autocmd filetype sh inoremap <F5> <Esc> :w <bar> exec '!bash '.shellescape('%')<CR>
    autocmd filetype sh nnoremap <F5> <Esc> :w <bar> exec '!bash '.shellescape('%')<CR>

    autocmd filetype php inoremap <F5> <Esc> :w <bar> exec '!php '.shellescape('%')<CR>
    autocmd filetype php nnoremap <F5> <Esc> :w <bar> exec '!php '.shellescape('%')<CR>
]])
