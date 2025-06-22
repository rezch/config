return function()
    require("tokyonight").setup({
        style = "storm",
        transparent = true,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            variables = {},
            sidebars = "transparent",
            floats = "transparent",
        },
    })
end
