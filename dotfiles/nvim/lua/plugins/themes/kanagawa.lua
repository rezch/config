return function()
    require('kanagawa').setup({
        commentStyle = { italic = true },
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        transparent = true,
    })

    vim.cmd(' silent!! KanagawaCompile ')
end
