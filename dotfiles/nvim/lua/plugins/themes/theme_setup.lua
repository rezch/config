local utils = require('base/utils')

local M = { }

local default_config = {
    themes = { },
    current_theme = 0,
    transparent = true,
    mode = "dark",
}

local config = { }

local function get_theme()
    if config.current_theme == 0 then
        return
    end
    return config.themes[config.current_theme]
end

local function find_config_impl(theme)
    theme = utils.GetPrefix(theme)
    local f = io.popen("dir ~/.config/nvim/lua/plugins/themes")
    if not f then
        return
    end
    for _, theme_config in ipairs(utils.Map(utils.Split(f:read("*a")), utils.GetPrefix)) do
        if theme_config == theme then
            return require('plugins/themes/' .. theme_config)
        end
    end
end

local function find_config(theme)
    local theme_config = find_config_impl(theme)
    return theme_config ~= nil
            and theme_config
            or function() end
end

local function set_transparency()
    if not config.transparent then
        return
    end
    local none_bg = { bg="none", ctermbg="none" }
    vim.api.nvim_set_hl(0, "Normal", none_bg)
    vim.api.nvim_set_hl(0, "NormalNC", none_bg)
    vim.api.nvim_set_hl(0, "SignColumn", none_bg)
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", none_bg)
    vim.api.nvim_set_hl(0, "NvimTreeNormal", none_bg)
end

local function hi_extra_whitespace()
    vim.api.nvim_command("hi def link ExtraWhitespace SpellBad")
    vim.cmd([[
        highlight ExtraWhitespace cterm=undercurl gui=undercurl guisp=#c53b53
        match ExtraWhitespace /\s\+$/
        au BufWinEnter * match ExtraWhitespace /\s\+$/
        au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        au InsertLeave * match ExtraWhitespace /\s\+$/
        au BufWinLeave * call clearmatches()
        au TermOpen    * call clearmatches() " to disable hi in yazi
    ]])
end

local function reload_theme()
    local theme = get_theme()
    if theme == nil then
        return
    end

    local theme_config = find_config(theme)
    theme_config()

    require('lualine').setup {
        options = {
            theme = theme
        }
    }

    vim.o.background = config.mode
    vim.o.termguicolors = true
    vim.cmd.colorscheme(theme)

    set_transparency()
    hi_extra_whitespace()
    theme_config()

    print('Current theme: ' .. theme)
end

function M.setup(user_config)
    config = vim.tbl_deep_extend('keep', user_config, default_config)
    reload_theme()
end

function NextTheme()
    config.current_theme = (config.current_theme) % utils.Len(config.themes) + 1
    reload_theme()
end

function PrevTheme()
    config.current_theme = (config.current_theme - 2) % utils.Len(config.themes) + 1
    reload_theme()
end

return M
