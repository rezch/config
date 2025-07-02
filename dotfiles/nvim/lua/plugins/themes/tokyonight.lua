return function(config)
    local style = config.transparent and "transparent" or "normal"
    require("tokyonight").setup({
        style = "storm",
        transparent = config.transparent,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            sidebars = style,
            floats = style,
        },
    })
end
