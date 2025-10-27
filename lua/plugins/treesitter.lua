return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c", "lua", "python", "r", "julia", "matlab", "markdown", "markdown_inline", "html", "css", "javascript", "rust", "gotmpl", "glsl", "c_sharp",
			},
			highlight = {enable = true},
			indent = {enable = true}
		})
	end,
	build = ":TSUpdate",
}

