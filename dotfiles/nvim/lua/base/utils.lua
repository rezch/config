local M = { }

-- [[ Strings ]] -
local function split_impl(args)
    setmetatable(args, {__index={sep="%s"}})
    local str, sep =
        args[1] or args.str,
        args[2] or args.sep
    local t = {}
    for s in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, s)
    end
    return t
end

function M.split(str, sep)
    return split_impl{str, sep=sep}
end

-- [[ Lists ]] --
function M.map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

function M.len(list)
    local count = 0
    for _, _ in pairs(list) do
        count = count + 1
    end
    return count
end

function M.append(list, value)
    list[M.Len(list) + 1] = value
end

-- [[ Files ]] --
function M.exists(file)
   local ok, _, code = os.rename(file, file)
   if not ok and code == 13 then
       return true -- Permission denied, but it exists
   end
   return ok
end

function M.isdir(path)
   return M.exists(path .. "/")
end

function M.get_prefix(str)
    return str:match('^[a-z]*')
end

function M.split_filename(filename)
    local f, e = filename:match("^(.+)%.(.+)$")
    return f, e
end

-- [[ Numbers ]] --
function M.intdiv(a, b)
    return math.floor(a / b)
end

-- [[ System ]] --
-- return: bool
-- is os has unix like file path
function M.is_unix()
    -- sub return '/' for unix systems and '\\' for windows
    return package.config:sub(1, 1) == '/'
end

-- return: os
-- { jit.os result, 'Linux', 'OSX', 'Windows' }
function M.os()
    if jit then
        return jit.os
    end

    local osname
    local fh, _ = assert(io.popen("uname -o 2>/dev/null", "r"))
    if fh then
        osname = fh:read()
    end

    return osname or "Windows"
end

return M
