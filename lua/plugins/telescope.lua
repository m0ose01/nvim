return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
	},
	opts = {
	extensions = {
	    fzf = {
	      fuzzy = true,                    -- false will only do exact matching
	      override_generic_sorter = true,  -- override the generic sorter
	      override_file_sorter = true,     -- override the file sorter
	      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
	    }
	  },
	},
	config = function(plugin, opts)
		require('telescope').setup(opts)
		require('telescope').load_extension('fzf')
		-- Telescope Shortcuts
		local telescope = require('telescope.builtin')
		Map('n', '<leader>ff', telescope.find_files, {})
		Map('n', '<leader>FF', telescope.git_files, {})
		Map('n', '<leader>fg', telescope.live_grep, {})
		Map('v', '<leader>fg', telescope.grep_string, {})
		Map('n', '<leader>fb', telescope.buffers, {})
		Map('n', '<leader>fh', telescope.help_tags, {})
	end,

}
