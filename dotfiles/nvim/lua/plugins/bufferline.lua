vim.opt.termguicolors = true
require("bufferline").setup({
    options = {
        icons = true,
        mode = 'buffers',
        offsets = {
            {filetype = 'NvimTree'}
        },
    },
    highlights = {
        buffer_selected = {
            italic = false
        },
        indicator_selected = {
            fg = {attribute = 'fg', highlight = 'Function'},
            italic = false
        }
    }
})
