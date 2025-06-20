function set_theme(theme)
    require('lualine').setup {
        options = {
            theme = theme
        }
    }

    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.cmd("colorscheme " .. theme)
    vim.cmd([[
        hi Normal guibg=NONE ctermbg=NONE
        hi NormalNC guibg=NONE ctermbg=NONE
        hi SignColumn guibg=NONE ctermbg=NONE
    ]])

    if theme == 'witchesbrew' then
        vim.cmd(" hi Comment guifg=#95a682 ")
    end
end
