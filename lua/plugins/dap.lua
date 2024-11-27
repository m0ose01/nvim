return {
    "mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"https://github.com/nvim-neotest/nvim-nio"
			},
			opts = {},
		},
	},
	config = function()
		--Debug Adapter Protocol Setup
		-- Debug Shortcuts
		local debug = require("dap")
		local debugui = require('dapui')

		debug.adapters.debugpy = {
			type = "server",
		}

		debug.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode-14",
			name = "lldb",
		}

		local lldb = {
			name = 'Launch lldb',
			type = 'lldb',
			request = 'launch',
			program = function ()
				return vim.fn.input(
					"Path to binary: ",
					vim.fn.getcwd() .. "/",
					"file"
				)
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = function ()
				return {vim.fn.input("Args: ")}
			end,
			runInTerminal = true,
		}

		debug.configurations = {
			c = {lldb},
		}

		Map('n', '<leader>db', debug.toggle_breakpoint)
		Map('n', '<leader>dB', function() debug.set_breakpoint(vim.fn.input('Condition: ')) end)
		Map('n', '<leader>dc', debug.continue)
		Map('n', '<leader>ds', debug.step_over)
		Map('n', '<leader>di', debug.step_into)
		Map('n', '<leader>do', debug.step_out)
		Map('n', '<leader>dd', debugui.toggle)
	end,
	keys = "<leader>dd"
}
