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
		print(plugin)
	end,

}
