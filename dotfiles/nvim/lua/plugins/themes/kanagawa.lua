return function(config)
    require('kanagawa').setup({
        commentStyle = { italic = true },
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        transparent = config.transparent,
    })

    vim.cmd(' silent!! KanagawaCompile ')
end
