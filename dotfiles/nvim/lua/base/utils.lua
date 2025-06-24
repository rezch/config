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

function M.Split(str, sep)
    return split_impl{str, sep=sep}
end

function M.GetPrefix(str)
    return str:match('^[a-z]*')
end

-- [[ Lists ]] --

function M.Map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

function M.Len(list)
    local count = 0
    for _, _ in pairs(list) do
        count = count + 1
    end
    return count
end

function M.Append(list, value)
    list[M.Len(list) + 1] = value
end

-- [[ Files ]] --
function M.exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok and code == 13 then
       return true -- Permission denied, but it exists
   end
   return ok
end

function M.isdir(path)
   return M.exists(path.."/")
end

return M
