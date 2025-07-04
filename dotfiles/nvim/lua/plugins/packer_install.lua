-- [[ Plugin manager ]] --

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    use { 'wbthomason/packer.nvim' }

    use({
        'rezch/vicom',
        config = function()
            require('plugins/vicom')
        end

    })

    -- LSP & other:
    use({
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('plugins/treesitter')
        end
    })

    use({
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins/lspconfig')
        end
    })

    use { 'p00f/clangd_extensions.nvim' }

    use({
        "MysticalDevil/inlay-hints.nvim",
        requires = { "neovim/nvim-lspconfig" },
        config = function()
            require('plugins/inlay-hints')
        end
    })

    use { 'onsails/lspkind-nvim' }

    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lua'
        },
        config = function()
            require('plugins/cmp')
        end
    })

    -- Moving

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins/telescope')
        end
    }

    use {
        'karb94/neoscroll.nvim',
        config = function()
            require('plugins/neoscroll')
        end
    }

    use {
        'mikavilpas/yazi.nvim',
        requires = { 'folke/snacks.nvim' },
    }

    -- UI:
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup()
        end
    })

    use({
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('plugins/nvim-tree')
        end
    })

    use({
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('plugins/bufferline')
        end
    })

    use 'nvim-tree/nvim-web-devicons'

    use({
        'mhinz/vim-signify',
        config = function()
            vim.opt.updatetime = 500
        end
    })

    -- Themes:
    use({
        'zenbones-theme/zenbones.nvim',
        requires = { 'rktjmp/lush.nvim' }
    })

    use { 'nyoom-engineering/oxocarbon.nvim' }

    use { 'catppuccin/nvim', as = 'catppuccin' }

    use({
        'folke/tokyonight.nvim',
        config = function()
            require('plugins/themes/tokyonight')
        end
    })

    use { 'Shadorain/shadotheme' }

    use({
        'shoenot/witchesbrew.nvim',
        requires = { 'rktjmp/lush.nvim' }
    })

    use { 'rebelot/kanagawa.nvim' }

    use { 'sainnhe/everforest' }
end)
