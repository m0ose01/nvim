require("mason").setup()

local cmp = require("cmp")
cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
	["<s-tab>"] = cmp.mapping.select_prev_item(),
    ["<tab>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
	sources = cmp.config.sources {
		{name = 'nvim_lsp'},
		{name = "luasnip"},
		{name = "buffer"},
		{name = "path"},
	}
}

local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

--Language Server Protocol Setup
require("mason-lspconfig").setup{
	automatic_installation = true,
}

require("lspconfig").basedpyright.setup {}
require("lspconfig").lua_ls.setup {
	capabilities = default_capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim', 'require'}
			}
		}
	}
}
require("lspconfig").eslint.setup {
	capabilities = default_capabilities,
}
require("lspconfig").julials.setup {
	capabilities = default_capabilities,
}
require("lspconfig").r_language_server.setup {
	capabilities = default_capabilities,
}
require("lspconfig").matlab_ls.setup {
	capabilities = default_capabilities,
}
require("lspconfig").marksman.setup {
	capabilities = default_capabilities,
}
require("lspconfig").clangd.setup {
	capabilities = default_capabilities,
	cmd = {'clangd', '--enable-config', '--background-index'}
}
require("lspconfig").rust_analyzer.setup {
	capabilities = default_capabilities,
}
require("lspconfig").html.setup {
	capabilities = default_capabilities,
}

-- LSP Shortcuts
Map('n', '<leader>gd', vim.lsp.buf.definition)
Map('n', '<leader>gD', vim.lsp.buf.declaration)
Map('n', '<leader>r', vim.lsp.buf.rename)
-- Telescope Shortcuts
local telescope = require('telescope.builtin')
Map('n', '<leader>ff', telescope.find_files, {})
Map('n', '<leader>FF', telescope.git_files, {})
Map('n', '<leader>fg', telescope.live_grep, {})
Map('v', '<leader>fg', telescope.grep_string, {})
Map('n', '<leader>fb', telescope.buffers, {})
Map('n', '<leader>fh', telescope.help_tags, {})
