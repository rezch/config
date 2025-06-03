local lspconfig = require('lspconfig')

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

lspconfig.clangd.setup({
	cmd = {
		'clangd',
		'--background-index',
		'--clang-tidy',
		'--log=verbose',
        "--completion-style=detailed",
        "--function-arg-placeholders",
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
		fallbackFlags = { '-std=c++2b' },
	},
})
