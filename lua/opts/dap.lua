--Debug Adapter Protocol Setup

require("mason-nvim-dap").setup(
	{
		ensure_installed = {
			"codelldb",
		}
	}
)

require("dapui").setup()

local dap = require("dap")

dap.adapters.debugpy = {
	type = "server",
}

dap.adapters.lldb = {
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

dap.configurations = {
	c = {lldb},
}

