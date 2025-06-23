local utils = require('base/utils')

local M = { }

local default_config = {
    themes = { },
    current_theme = 0,
    transparent = true,
    mode = "dark",
}

local config = { }

local function find_config(theme)
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

local function set_transparency()
    local none_bg = { bg="none", ctermbg="none" }
    vim.api.nvim_set_hl(0, "Normal", none_bg)
    vim.api.nvim_set_hl(0, "NormalNC", none_bg)
    vim.api.nvim_set_hl(0, "SignColumn", none_bg)
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", none_bg)
    vim.api.nvim_set_hl(0, "NvimTreeNormal", none_bg)
end

local function reload_theme()
    if config.current_theme == 0 then
        return
    end

    local theme = config.themes[config.current_theme]
    local theme_config = find_config(theme)

    if theme_config then
        theme_config()
    end

    require('lualine').setup {
        options = {
            theme = theme
        }
    }

    vim.o.background = config.mode
    vim.o.termguicolors = true
    vim.cmd("colorscheme " .. theme)

    if config.transparent then
        set_transparency()
    end
    local none_bg = { bg="none", ctermbg="none" }
    vim.api.nvim_set_hl(0, "Normal", none_bg)
    vim.api.nvim_set_hl(0, "NormalNC", none_bg)
    vim.api.nvim_set_hl(0, "SignColumn", none_bg)
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", none_bg)
    vim.api.nvim_set_hl(0, "NvimTreeNormal", none_bg)


    if theme_config then
        theme_config()
    end
end

function M.setup(user_config)
    config = vim.tbl_deep_extend('keep', user_config, default_config)
    reload_theme()
end

function NextTheme()
    config.current_theme = config.current_theme + 1
    config.current_theme = (config.current_theme - 1) % utils.Len(config['themes']) + 1
    reload_theme()
end

function PrevTheme()
    config.current_theme = config.current_theme - 1
    config.current_theme = (config.current_theme - 1) % utils.Len(config['themes']) + 1
    reload_theme()
end

return M
