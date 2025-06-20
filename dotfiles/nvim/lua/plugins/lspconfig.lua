local lspconfig = require('lspconfig')


vim.lsp.enable('gopls')
vim.lsp.enable('bashls')
vim.lsp.enable('pyright')

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

lspconfig.intelephense.setup({
    cmd = { 'env', 'HOME=/tmp', 'intelephense', '--stdio' },
    on_attach = function(client, bufnr)
        -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    end,
    root_dir = function ()
        return vim.loop.cwd()
    end,
    filetypes = { "php", "html" },
    flags = {
        debounce_text_changes = 150,
    }
})

function get_cpp_flags()
    if (filetype == "cpp") then
        return { '-std=c++2b' }
    end
    return { }
end

lspconfig.clangd.setup({
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--log=verbose',
        "--completion-style=detailed",
        "--function-arg-placeholders=true",
    },
    capabilities = {
        textDocument = {
            semanticHighlightingCapabilities = {
                semanticHighlighting = true
            },
        }
    },
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
        InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
        },
        fallbackFlags = get_cpp_flags(),
        extra_args = { "--style=file" },
    },
})
