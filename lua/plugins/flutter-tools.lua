return {
	{
		"stevearc/dressing.nvim",
		lazy = true,
	},
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
			"mfussenegger/nvim-dap",
			"hrsh7th/cmp-nvim-lsp",
		},
		keys = {
			{ "<leader>mr", "<cmd>FlutterRun<cr>", desc = "Flutter Run" },
			{ "<leader>md", "<cmd>FlutterDevices<cr>", desc = "Flutter Devices" },
			{ "<leader>me", "<cmd>FlutterEmulators<cr>", desc = "Flutter Emulators" },
			{ "<leader>ml", "<cmd>FlutterReload<cr>", desc = "Flutter Reload" },
			{ "<leader>mR", "<cmd>FlutterRestart<cr>", desc = "Flutter Restart" },
			{ "<leader>mq", "<cmd>FlutterQuit<cr>", desc = "Flutter Quit" },
		},
		config = function()
			require("flutter-tools").setup({
				debugger = {
					enabled = true,
				},
				fvm = true,
				lsp = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					settings = {
						completeFunctionCalls = true,
						showTodos = true,
						renameFilesWithClasses = "prompt",
						updateImportsOnRename = true,
					},
				},
			})
		end,
	},
}
