return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		lazy = false,
		config = function()
			require("oil").setup({
			})
			vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
