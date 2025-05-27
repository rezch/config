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

    -- UI:
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		config = function()
			require('plugins/lualine')
		end
	})

 -- use({
 -- 	'nvim-neo-tree/neo-tree.nvim',
 -- 	branch = 'v3.x',
 -- 	requires = {
 -- 		'nvim-lua/plenary.nvim',
 -- 		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
 -- 		'MunifTanjim/nui.nvim',
 -- 		-- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
 -- 	},
 -- 	config = function()
 -- 		require('plugins/neo-tree')
 -- 	end
 -- })

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

	-- Themes:
	use({
		'zenbones-theme/zenbones.nvim',
		requires = {
			'rktjmp/lush.nvim'
		}
	})

	use { 'nyoom-engineering/oxocarbon.nvim' }

	use { 'catppuccin/nvim', as = 'catppuccin' }

end)
