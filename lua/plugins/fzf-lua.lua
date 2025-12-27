return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local fzf = require("fzf-lua")
		Map('n', '<leader>ff', fzf.files, {})
		Map('n', '<leader>fg', fzf.live_grep_native, {})
		Map('v', '<leader>fg', fzf.grep_visual, {})
		Map('n', '<leader>fb', fzf.buffers, {})
		Map('n', '<leader>fs', fzf.lsp_live_workspace_symbols, {})
	end
}
