require('plugins/packer_install')

require('base/search')
require('base/tabs')
require('base/other')

require('keys/main')

vim.opt.relativenumber = true

vim.cmd([[
	set background=dark
	set termguicolors
	colorscheme catppuccin
	hi Normal guibg=NONE ctermbg=NONE
]])
