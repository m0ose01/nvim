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

