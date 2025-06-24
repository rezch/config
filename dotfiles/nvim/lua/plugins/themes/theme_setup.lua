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
    return config.current_theme == 0
        and nil
        or config.themes[config.current_theme]
end

-- [[ Check config files existence ]] --

local function find_config_impl(theme)
    local path = "~/.config/nvim/lua/plugins/themes";
    local f = io.popen("dir " .. path)
    if not f then
        return
    end

    theme = utils.GetPrefix(theme)
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

local function has_packer_folder(theme)
    local path = "~/.local/share/nvim/site/pack/packer/start";
    local f = io.popen("dir " .. path)
    if not f then
        return false
    end

    theme = utils.GetPrefix(theme)
    for _, theme_config in ipairs(utils.Map(utils.Split(f:read("*a")), utils.GetPrefix)) do
        if theme_config == theme then
            return true
        end
    end

    return false
end

-- [[ Color setup ]] --

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
    vim.cmd([[
        hi def link ExtraWhitespace SpellBad
        hi ExtraWhitespace cterm=undercurl gui=undercurl guisp=#c53b53
        match ExtraWhitespace /\s\+$/
        au BufWinEnter * match ExtraWhitespace /\s\+$/
        au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        au InsertLeave * match ExtraWhitespace /\s\+$/
        au BufWinLeave * call clearmatches()
        au TermOpen    * call clearmatches() " to disable hi in yazi
    ]])
end

-- reload theme and options
local function reload_theme()
    local theme = get_theme()
    if theme == nil then
        return
    end

    local theme_config = find_config(theme)
    theme_config()

    if has_packer_folder(theme) then
        require('lualine').setup {
            options = { theme = theme }
        }
    end

    vim.o.background = config.mode
    vim.o.termguicolors = true
    vim.cmd.colorscheme(theme)

    set_transparency()
    hi_extra_whitespace()
    theme_config()
end

-- [[ Global functions ]] --

function M.setup(user_config)
    config = vim.tbl_deep_extend('keep', user_config, default_config)
    reload_theme()
end

function NextTheme()
    config.current_theme = (config.current_theme) % utils.Len(config.themes) + 1
    reload_theme()
    print('Current theme: ' .. get_theme())
end

function PrevTheme()
    config.current_theme = (config.current_theme - 2) % utils.Len(config.themes) + 1
    reload_theme()
    print('Current theme: ' .. get_theme())
end

function SetTheme(theme)
    utils.Append(config.themes, theme)
    config.current_theme = utils.Len(config.themes)
    reload_theme()
end

return M
