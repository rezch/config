local lspconfig = require('lspconfig')


vim.lsp.enable('gopls')
vim.lsp.enable('bashls')
vim.lsp.enable('pyright')
vim.lsp.enable('hls')

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
        -- source = 'always',
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

local function get_cpp_flags()
    if (filetype == 'cpp') then
        return { '-std=c++2b' }
    end
    return { }
end

lspconfig.clangd.setup({
    cmd = {
        'clangd',
        '--background-index',
        '-j=8',
        '--clang-tidy',
        '--log=verbose',
        '--completion-style=detailed',
        '--function-arg-placeholders=0',
    },
    capabilities = {
        textDocument = {
            semanticHighlightingCapabilities = {
                semanticHighlighting = true
            },
        }
    },
    init_options = {
        clangdFileStatus = true,
        fallbackFlags = get_cpp_flags(),
        extra_args = { '--style=file' },
    },
})

lspconfig.lua_ls.setup({
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})
