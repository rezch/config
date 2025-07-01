local utils = require('base/utils')

local function winSize()
    local size = utils.intdiv(vim.api.nvim_win_get_width(0), 7)
    return size > 10 and size or 0
end

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    once = true,
    callback = function(_)
        if winSize() == 0 then
            return
        end
        vim.cmd([[
        NvimTreeToggle
        wincmd p
        ]])
    end,
})

-- close tree on last tab
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
        end
    end
})

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = winSize(),
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                folder_arrow = false,
                git = true
            },
        }
    },
    filters = {
        dotfiles = true
    }
})
