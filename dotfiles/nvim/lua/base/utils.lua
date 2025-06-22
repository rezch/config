local function split_impl(args)
    setmetatable(args, {__index={sep="%s"}})
    local str, sep =
    args[1] or args.str,
    args[2] or args.sep
    local t = {}
    for s in string.gmatch(str, "([^"..sep.."]+)") do
        table.insert(t, s)
    end
    return t
end

function Split(str, sep)
    return split_impl{str, sep=sep}
end

function Map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

function GetPrefix(str)
    return str:match('^[a-z]*')
end

function Len(list)
    local count = 0
    for _, _ in pairs(list) do
        count = count + 1
    end
    return count
end
