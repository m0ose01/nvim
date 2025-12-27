-- LSP Shortcuts
Map('n', '<leader>gd', vim.lsp.buf.definition)
Map('n', '<leader>gD', vim.lsp.buf.declaration)
Map('n', '<leader>r', vim.lsp.buf.rename)

-- N.B. also had to install LanguageServer.jl, SymbolServer.jl and StaticLint.jl in the shared environment '@nvim-lspconfig'
vim.lsp.enable("julials")
