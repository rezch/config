--[[ Настройка панелей ]]--
-- Вертикальные сплиты становятся справа
-- По умолчанию панели в Neovim ставятся в зависимости от расположения текущей панели. Данная настройка поможет нам держать панели в порядке
vim.opt.splitright = true

-- Горизонтальные сплиты становятся сверху
vim.opt.splitbelow = false

--[[ Дополнительные настройки ]]--
-- Используем системный буфер обмена
vim.opt.clipboard = 'unnamedplus'

-- Отключаем дополнение файлов в конце
vim.opt.fixeol = false

-- Автодополнение (встроенное в Neovim)
vim.opt.completeopt = 'menuone,noselect'

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})

-- [[ Whitespaces ]] --
vim.cmd([[
    highlight ExtraWhitespace ctermbg=LightMagenta guibg=LightMagenta
    match ExtraWhitespace /\s\+$/
    au BufWinEnter * match ExtraWhitespace /\s\+$/
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhitespace /\s\+$/
    au BufWinLeave * call clearmatches()
    au TermOpen    * call clearmatches() " to disable hi in yazi mode
]])
