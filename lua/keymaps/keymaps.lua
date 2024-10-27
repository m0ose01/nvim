-- Shorthand for keymap creation
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
	end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- General shortcuts
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<C-c>", "<esc>")

-- Toggle plugins

map('t', '<esc><esc>', '<C-\\><C-n>')

-- LSP Shortcuts
map('n', '<leader>gd', vim.lsp.buf.definition)
map('n', '<leader>gD', vim.lsp.buf.declaration)
map('n', '<leader>r', vim.lsp.buf.rename)

-- Debug Shortcuts
local debug = require('dap')
local debugui = require('dapui')

map('n', '<leader>db', debug.toggle_breakpoint)
map('n', '<leader>dB', function() debug.set_breakpoint(vim.fn.input('Condition: ')) end)
map('n', '<leader>dc', debug.continue)
map('n', '<leader>ds', debug.step_over)
map('n', '<leader>di', debug.step_into)
map('n', '<leader>do', debug.step_out)

map('n', '<leader>dd', debugui.toggle)

-- Telescope Shortcuts
local telescope = require('telescope.builtin')
map('n', '<leader>ff', telescope.find_files, {})
map('n', '<leader>FF', telescope.git_files, {})
map('n', '<leader>fg', telescope.live_grep, {})
map('v', '<leader>fg', telescope.grep_string, {})
map('n', '<leader>fb', telescope.buffers, {})
map('n', '<leader>fh', telescope.help_tags, {})

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

map('i', '<A-z>', ZoteroCite)
map('n', '<leader>zz', ZoteroCite)

-- Iron nvim shortcuts
local iron = require("iron.core")
map('n', '<leader>jj', '<cmd>IronRepl<CR>')
map('n', '<C-j>', iron.send_line)
map('v', '<C-j>', iron.visual_send)
