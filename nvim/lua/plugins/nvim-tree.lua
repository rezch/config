vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    once = true,
    callback = function(_)
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
        width = 22,
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                file = true,
                folder = false,
                folder_arrow = false,
                git = true
            }
  }
    },
    filters = {
        dotfiles = true,
    },
})

vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
