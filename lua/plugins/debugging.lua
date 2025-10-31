return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go"
	},
	config = function()
		local dap = require('dap')
		local dapui = require("dapui")

		require("dapui").setup()
		require('dap-go').setup()

		dap.adapters.coreclr = {
			type = 'executable',
			command = '/usr/bin/netcoredbg',
			args = { '--interpreter=vscode' }
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
				end,
			},
		}

		vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = "Continue/Start Debugging" })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
