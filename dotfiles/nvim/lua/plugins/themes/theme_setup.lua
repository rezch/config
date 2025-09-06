local utils = require('base/utils')

local M = { }

-- [[ Config ]] --
local default_config = {
    themes = { },
    current_theme = 0,
    transparent = true,
    mode = "dark",
    bg_color = nil,
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
    local f = io.popen("ls " .. path)
    if not f then
        return
    end

    theme = utils.get_prefix(theme)
    for _, theme_config in ipairs(utils.split(f:read("*a"))) do
        if utils.get_prefix(theme_config) == theme then
            return require('plugins/themes/' .. utils.split_filename(theme_config))
        end
    end
end

local function find_config(theme)
    local theme_config = find_config_impl(theme)
    return theme_config ~= nil
            and theme_config
            or function(...) end
end

-- [[ Color setup ]] --
local function set_hi(...)
    vim.api.nvim_set_hl(0, ...)
end

local function set_transparency()
    if config.bg_color ~= nil then
        config.transparent = false
    end

    if not config.transparent and not config.bg_color then
        return
    end

    local bg_color = config.bg_color ~= nil
            and config.bg_color
            or "none"

    local none_bg = { bg=bg_color, ctermbg="none" }
    local hi_params = {
        "Normal",
        "NormalNC",
        "SignColumn",
        "LineNr",
        "NvimTreeIndentMarker",
        "NvimTreeNormal",
        "NvimTreeEndOfBuffer",
        "CursorLine",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
        "NormalFloat",
        "NvimTreeNormalFloat",
        "TabLineFill",
        "FloatermBorder",
        "TelescopeBorder",
    }

    if config.transparent then
        table.insert(hi_params, "LspInlayHint")
    end

    for _, param in ipairs(hi_params) do
        set_hi(param, none_bg)
    end
end

local function hi_extra_whitespace()
    set_hi("ExtraWhitespace", { link = "SpellBad" })

    vim.cmd([[
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
    theme_config(config)

    vim.o.background = config.mode
    vim.o.termguicolors = true
    vim.cmd.colorscheme(theme)

    set_transparency()

    hi_extra_whitespace()
    theme_config(config)
end

-- [[ Global functions ]] --
function M.setup(user_config)
    config = vim.tbl_deep_extend('keep', user_config, default_config)
    reload_theme()
end

function NextTheme()
    config.current_theme = (config.current_theme) % utils.len(config.themes) + 1
    reload_theme()
    print('Current theme: ' .. get_theme())
end

function PrevTheme()
    config.current_theme = (config.current_theme - 2) % utils.len(config.themes) + 1
    reload_theme()
    print('Current theme: ' .. get_theme())
end

function SetTheme(theme)
    utils.append(config.themes, theme)
    config.current_theme = utils.len(config.themes)
    reload_theme()
end

return M
