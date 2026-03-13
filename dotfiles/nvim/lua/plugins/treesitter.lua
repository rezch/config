require('nvim-treesitter.config').setup {
    ensure_installed = {
        "c",
        "c3",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
    },
    highlight = { enable = true },

    parser_install_info = {
        c3 = {
            install_info = {
                url = "https://github.com/c3lang/tree-sitter-c3",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "main",
            },
            sync_install = false, -- Set to true if you want to install synchronously
            auto_install = true,  -- Automatically install when opening a file
            filetype = "c3",      -- if filetype does not match the parser name
        },
    },
}

vim.api.nvim_create_autocmd("FileType", {
    group = init,
    callback = function(args)
        local filetype = args.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if vim.treesitter.language.add(lang) then
            vim.treesitter.start()
        end
    end,
})

-- For shit lang
-- vim.cmd(' au BufRead,BufNewFile *.shit setfiletype shit ')
-- vim.treesitter.language.register('shit', 'shit')
--
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.shit = {
--     install_info = {
--         url = "~/source/projects/llvm/tree-sitter-shit",
--         files = {
--             "src/parser.c",
--         },
--         -- generate_requires_npm = true,
--         -- requires_generate_from_grammar = true,
--     },
--     filetype = "shit",
-- }
