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

-- N.B. also had to install LanguageServer.jl, SymbolServer.jl and StaticLint.jl in the shared environment '@nvim-lspconfig'
vim.lsp.enable("julials")
