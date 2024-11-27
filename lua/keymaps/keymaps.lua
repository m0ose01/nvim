-- General shortcuts
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")
Map("n", "<C-c>", "<esc>")

-- Toggle plugins

Map('t', '<esc><esc>', '<C-\\><C-n>')

-- Zotero Citation Picker
function ZoteroCite()
	local url = '"http://127.0.0.1:23119/better-bibtex/cayw?format=pandoc&brackets=yes"'
	local handle = io.popen('curl -s ' .. url)
	local citekey = handle:read("*a")
	citekey = citekey:gsub('[\n\r]', ' ')
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_text(0,row - 1, col, row - 1, col, {citekey})
	end

Map('i', '<A-z>', ZoteroCite)
Map('n', '<leader>zz', ZoteroCite)

