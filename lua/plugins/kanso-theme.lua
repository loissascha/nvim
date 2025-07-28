return {
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			background = "zen"
		},
		config = function()
			vim.cmd("colorscheme kanso-zen")
		end
	}
}
