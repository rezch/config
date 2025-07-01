-- [[ nu ]] --
vim.opt.number = true
vim.opt.relativenumber = true

-- [[ Win splitting ]] --
vim.opt.splitright = true
vim.opt.splitbelow = false

-- [[ Clipboard ]] --
vim.opt.clipboard = 'unnamedplus'

-- [[ Disable autocomment new lines ]] --
vim.cmd(" autocmd BufEnter * set fo-=c fo-=r fo-=o ")

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*" },
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"", false)
        end
    end
})

-- [[ Whitespaces ]] --
vim.cmd([[
    set list
    set lcs+=lead:·
    set lcs+=multispace:·
    set lcs+=trail:·
]])


-- [[ Tabs ]] --
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.cursorline = true

-- [[ Search ]] --
-- Ignore case in search
vim.opt.ignorecase = true

-- Dont ignore case, if there are upper-case symbols
vim.opt.smartcase = true

-- Highlight
vim.opt.showmatch = true

-- [[ Other ]] --
-- disable autocomplete files
vim.opt.fixeol = false

-- disable nvim autocomplete
vim.opt.completeopt = 'menuone,noselect'

-- disable folding
vim.cmd(" set nofoldenable ")
