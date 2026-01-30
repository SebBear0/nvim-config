-- Highlight todo, notes, etc in comments
return {
	---@type LazySpec
	{
		'mikavilpas/yazi.nvim',
		version = '*', -- use the latest stable version
		event = 'VeryLazy',
		dependencies = {
			{ 'nvim-lua/plenary.nvim', lazy = true },
		},
		keys = {
			{
				'se',
				mode = { 'n', 'v' },
				'<cmd>Yazi<cr>',
				desc = '[S]earch with file [E]xplorer',
			},
			{
				-- Open in the current working directory
				'sE',
				'<cmd>Yazi cwd<cr>',
				desc = '[S]earch CWD with [E]xplorer',
			},
		},
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = true,
			keymaps = {
				show_help = '<f1>',
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- mark netrw as loaded so it's not loaded at all.
			--
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
