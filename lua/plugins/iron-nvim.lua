return {
	"Vigemus/iron.nvim",
	config = function()
		local iron = require("iron.core")
		iron.setup {
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
		-- Iron nvim shortcuts
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {"R", "julia", "matlab", "python", "javascript"},
			callback = function()
				Map('n', '<leader>jj', '<cmd>IronRepl<CR>')
				Map('n', '<C-j>', iron.send_line)
				Map('v', '<C-j>', iron.visual_send)
			end
		})
	end,
	ft = {"R", "julia", "matlab", "python", "javascript", "quarto"},
}
