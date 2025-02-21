return {
	{
		-- use cs (change surround) followed by the current surround (for example ') and then the new surround (for example ")
		-- or use cst to change the surround of html tags
		-- ds = delete surround -> followed by the current surrounding
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}
