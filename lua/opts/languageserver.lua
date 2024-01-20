require("mason").setup()

--Language Server Protocol Setup

require("mason-lspconfig").setup{
	automatic_installation = false,
}

require("lspconfig").pyright.setup {}
require("lspconfig").lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim', 'require'}
			}
		}
	}
}
require("lspconfig").eslint.setup {}
require("lspconfig").julials.setup {}
require("lspconfig").r_language_server.setup {}
require("lspconfig").matlab_ls.setup {}
require("lspconfig").marksman.setup {}
require("lspconfig").clangd.setup {}

--Custom Commands

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
	runInTerminal = false,
}

dap.configurations = {
	c = {lldb},
}

