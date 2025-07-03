-- [[ fast key mapping ]] --

local map = vim.api.nvim_set_keymap

local M = { }

-- [[ normal ]] --
function M.nm(key, command)
    map('n', key, command, { noremap = true })
end

-- [[ input ]] --
function M.im(key, command)
    map('i', key, command, { noremap = true })
end

-- [[ visual ]] --
function M.vm(key, command)
    map('v', key, command, { noremap = true })
end

-- [[ terminal ]] --
function M.tm(key, command)
    map('t', key, command, { noremap = true })
end

function M.all(key, command)
    M.nm(key, command)
    M.im(key, '<C-O>' .. command)
    M.vm(key, '<C-S>' .. command)
end

return M
