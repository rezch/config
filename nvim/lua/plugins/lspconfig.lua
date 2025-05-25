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

lspconfig.clangd.setup({
	cmd = {
		'clangd',
		'--background-index',
		'--clang-tidy',
		'--log=verbose'
	},
    capabilities = {
        textDocument = {
            semanticHighlightingCapabilities = {
                semanticHighlighting = true
            },
        }
    },
	init_options = {
        InlayHints = {
            Designators = true,
            Enabled = true,
            ParameterNames = true,
            DeducedTypes = true,
        },
		fallbackFlags = { '-std=c++2b' },
	},
    settings = {
        clangd = {
            InlayHints = {
                Designators = true,
                Enabled = true,
                ParameterNames = true,
                DeducedTypes = true,
            },
            fallbackFlags = { "-std=c++20" },
        },
    }
})
