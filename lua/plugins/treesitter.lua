return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			require("nvim-treesitter").install({
				"lua",
				"go",
				"javascript",
				"typescript",
				"tsx",
				"svelte",
				"html",
				"css",
				"json",
				"bash",
				"c",
				"dart",
				"php",
				"gdscript",
				"kotlin",
				"zig",
				"templ",
				"odin"
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	}
}
