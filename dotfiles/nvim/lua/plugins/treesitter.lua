require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
    },
    highlight = { enable = true },
}


-- For shit lang
vim.cmd(' au BufRead,BufNewFile *.shit setfiletype shit ')
vim.treesitter.language.register('shit', 'shit')

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.shit = {
    install_info = {
        url = "~/source/projects/llvm/tree-sitter-shit",
        files = {
            "src/parser.c",
        },
        -- generate_requires_npm = true,
        -- requires_generate_from_grammar = true,
    },
    filetype = "shit",
}

