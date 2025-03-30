return {
	'godlygeek/tabular',
	dependencies = {
		'preservim/vim-markdown',
		config = function ()
			vim.g.vim_markdown_math = 1
			vim.g.vim_markdown_frontmatter = 1
		end
	},
	ft = {"md", "markdown", "quarto", "Rmd"},
}
