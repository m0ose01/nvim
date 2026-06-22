return {
    "mfussenegger/nvim-dap",
	dependencies = {
		{
			"igorlfs/nvim-dap-view",
			opts = {
				winbar = {
					sections = {
						"watches",
						"scopes",
						"exceptions",
						"breakpoints",
						"threads",
						"repl",
						"console",
					}
				}
			},
		},
	},
	config = function()
		--Debug Adapter Protocol Setup
		-- Debug Shortcuts
		local dap = require("dap")
		local debugui = require("dap-view")

		dap.set_log_level("DEBUG")

		dap.adapters.debugpy = {
			type = "server",
		}

		local lldb_dap_executable = "/usr/bin/lldb-vscode-14"
		if vim.loop.os_uname().sysname == "Darwin" then
			lldb_dap_executable = "/Library/Developer/CommandLineTools/usr/bin/lldb-dap"
		end
		dap.adapters.lldb = {
			type = "executable",
			command = lldb_dap_executable,
			name = "lldb",
		}

		dap.configurations = {
		}

		Map('n', '<leader>db', dap.toggle_breakpoint)
		Map('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Condition: ')) end)
		Map('n', '<leader>dc', dap.continue)
		Map('n', '<leader>ds', dap.step_over)
		Map('n', '<leader>di', dap.step_into)
		Map('n', '<leader>do', dap.step_out)
		Map('n', '<leader>dd', debugui.toggle)
	end,
	keys = "<leader>dd"
}
