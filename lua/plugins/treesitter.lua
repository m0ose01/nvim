return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build=":TSUpdate",
	opts = {},
	start = function()
		require("nvim-treesitter").install({
			"c", "lua", "python", "r", "julia", "matlab", "markdown", "markdown_inline", "html", "css", "javascript", "rust", "gotmpl", "glsl", "c_sharp",
		})
		vim.api.nvim_create_autocmd('FileType', {
			pattern = { '<filetype>' },
			callback = function() vim.treesitter.start() end,
})
	end,
	build = ":TSUpdate",
}

