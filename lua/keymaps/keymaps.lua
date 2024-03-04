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
map('n', '<leader>e', ':NvimTreeToggle<Cr>')

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
