return {
	"Vigemus/iron.nvim",
	config = function()
		require("iron.core").setup {
			config = {
				scratch_repl = false,
				repl_open_cmd = require("iron.view").split.bot("20%"),
				repl_definition = {
					matlab = {
						command = { "matlab", "-nosplash", "-nodesktop" },
					}
				}
			},
		}
	end,
}
