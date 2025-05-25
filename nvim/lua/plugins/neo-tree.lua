-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	pattern = "*",
-- 	group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
-- 	once = true,
-- 	callback = function(_)
-- 		vim.cmd([[
-- 			Neotree
-- 			wincmd p
-- 		]])
-- 	end,
-- })

vim.api.nvim_create_autocmd("TabNew", {
	group = vim.api.nvim_create_augroup("NeotreeOnNewTab", { clear = true }),
	command = "Neotree",
})

require("neo-tree").setup({
	close_if_last_window = true,
	enable_diagnostics = true,
	enable_git_status = true,
	popup_border_style = "rounded",
	sort_case_insensitive = false,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
	window = { width = 20 },
})
