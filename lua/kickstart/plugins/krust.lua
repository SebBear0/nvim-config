return {
	{
		'alexpasmantier/krust.nvim',
		ft = 'rust',
		opts = {
			keymap = 'k', -- Set a keymap for Rust buffers
			float_win = {
				border = 'rounded', -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
				auto_focus = false, -- Auto-focus float (default: false)
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
