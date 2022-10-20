-------------------------------------
-- @alias. 缩写 指令 与 别名
-- @author 简律纯
-------------------------------------

---------------settings--------------
local settings = {

}
-------------------------------------
package.path = getDiceDir() .. "/mod/alias/script/yaml.lua"

local yaml = require("yaml")

local write_file = function(path, text, mode)
    file = io.open(path, mode) --"a"
    io.output(file)
    io.write(text)
    io.close()
end

local read_file = function(path, mode)
    local text = ""
    local file = io.open(path, mode)
    if (file ~= nil) then
        text = file.read(file, "*a")
        io.close(file)
    else
        return "没有该文件或文件内容为空哦"
    end
    return tostring(text)
end

local split = function(str, pat)
    local t = {}
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(t, cap)
        end
        last_end = e + 1
        s, e, cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
        cap = str:sub(last_end)
        table.insert(t, cap)
    end
    return t
end