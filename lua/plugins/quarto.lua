return {
	"quarto-dev/quarto-nvim",
	dependencies = {
		"jmbuhr/otter.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = "quarto",
	config = function()
		local opts = {
			codeRunner = {default_method = "iron"}
		}
		local quarto = require("quarto")
		quarto.setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {"quarto"},
			callback = function()
				local runner = require("quarto.runner")
				Map('n', '<C-j>', runner.run_line)
				Map('n', '<C-k>', runner.run_cell)
				Map('v', '<C-j>', runner.run_range)
			end
		})
	end,
}
