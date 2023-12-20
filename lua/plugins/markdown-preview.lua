return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
	ft = {"markdown", "md"},
	config = function()
		vim.fn["mkdp#util#install"]()
    	end,
}
