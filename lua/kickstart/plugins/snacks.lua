return {
	{
		'folke/snacks.nvim',
		---@type snacks.Config
		opts = {
			picker = {
				-- your picker configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			explorer = {},
			notifier = {},
			---@type table<string, snacks.win.Config>
			styles = {
				{
					border = true,
					zindex = 100,
					ft = 'markdown',
					wo = {
						winblend = 5,
						wrap = false,
						conceallevel = 2,
						colorcolumn = '',
					},
					bo = { filetype = 'snacks_notif' },
				},
			},
		},
		keys = {
			{
				'sg',
				function()
					Snacks.picker.grep()
				end,
				desc = '[S]earch with [G]rep',
			},
			{
				'sb',
				function()
					Snacks.picker.lines()
				end,
				desc = '[S]earch [B]uffer',
			},
			{
				'sf',
				function()
					Snacks.picker.files()
				end,
				desc = '[S]earch [F]iles',
			},
			{
				'sr',
				function()
					Snacks.picker.resume()
				end,
				desc = '[S]earch [R]esume',
			},
			{
				'sd',
				function()
					Snacks.picker.diagnostics()
				end,
				desc = '[S]earch [D]iagnostics',
			},
			{
				'sD',
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = '[S]earch Buffer [D]iagnostics',
			},

			{
				'gd',
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = '[G]oto [D]efinition',
			},
			{
				'gD',
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = '[G]oto [D]eclaration',
			},
			{
				'gr',
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = '[G]oto [R]eferences',
			},
			{
				'gI',
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = '[G]oto [I]mplementation',
			},
			{
				'gy',
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = '[G]oto T[y]pe Definition',
			},
			{
				'ss',
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = '[S]earch [S]ymbols',
			},
			{
				'sS',
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = '[S]earch Workspace [S]ymbols',
			},
		},
		init = function()
			vim.api.nvim_create_autocmd('LspProgress', {
				---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
				callback = function(ev)
					local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
					vim.notify(vim.lsp.status(), 'info', {
						id = 'lsp_progress',
						title = 'LSP Progress',
						opts = function(notif)
							notif.icon = ev.data.params.value.kind == 'end' and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
