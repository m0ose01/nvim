return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = "quarto",
	opts = {
		codeRunner = {default_method = "iron"}
	}
}
