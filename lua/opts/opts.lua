-- Set background colour
vim.cmd('colorscheme rose-pine')
vim.opt.termguicolors = true

-- Set transparency

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Code Folding
vim.cmd(":set nofoldenable")

-- Spacing
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Spell check
vim.opt.spelllang = 'en_gb'
vim.opt.spell = true

vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
