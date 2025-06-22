require('base/utils')

ThemeIndex = 1

local themes = {
    'witchesbrew',
    'tokyonight-moon',
    'zenburned',
}

local function find_config(theme)
    theme = GetPrefix(theme)
    local f = io.popen("dir ~/.config/nvim/lua/plugins/themes")
    if not f then
        return
    end
    for _, config in ipairs(Map(Split(f:read("*a")), GetPrefix)) do
        if config == theme then
            return require('plugins/themes/' .. config)
        end
    end
end

local function set_theme(ind)
    ThemeIndex = ind
    local theme = themes[ThemeIndex]
    local config = find_config(theme)
    if config then config() end

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
        hi NvimTreeIndentMarker guibg=NONE ctermbg=NONE
    ]])
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })

    if config then config() end
end

function NextTheme()
    ThemeIndex = ThemeIndex + 1
    ThemeIndex = (ThemeIndex - 1) % Len(themes) + 1
    set_theme(ThemeIndex)
end

function PrevTheme()
    ThemeIndex = ThemeIndex - 1
    ThemeIndex = (ThemeIndex - 1) % Len(themes) + 1
    set_theme(ThemeIndex)
end

return set_theme
