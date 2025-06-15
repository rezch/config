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
end
