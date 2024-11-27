-- Shorthand for keymap creation
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
	end
    vim.keymap.set(mode, lhs, rhs, options)
end

require("lazy-config")
require("opts")
require("keymaps")
