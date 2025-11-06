return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"basedpyright",
			"clangd",
			"eslint",
			"html",
			-- "julials",
			"lua_ls",
			"r_language_server",
			"matlab_ls",
			"marksman",
			"rust_analyzer",
		},
	},
	dependencies = {{ "mason-org/mason.nvim", opts = {
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		}},
		"neovim/nvim-lspconfig",
		"seblyng/roslyn.nvim",
	},
}
