return {
	"williamboman/mason.nvim",
	opts = {
	ensure_installed = {'pyright'}
	},
	dependencies = {
		"williamboman/mason-lspconfig"
	},
	automatic_installation = true,
}
