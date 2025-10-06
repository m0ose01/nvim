return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"basedpyright",
			"clangd",
			"eslint",
			"html",
			"julials",
			"lua_ls",
			"r_language_server",
			"matlab_ls",
			"marksman",
			"rust_analyzer",
		}
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
