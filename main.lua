
local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["src.util"] = function(...) 
local ____exports = {}
____exports.TEST_CONSTANT = "Remove this when you add your own module files that you import from main.ts. This is an export, it wouldn't be here, but TypescriptToLua has a bug where if you only have a single file with no imports or exports, everything runs twice. Will be removed, along with this file, in a future update as soon as the TypescriptToLua team fixes it."
return ____exports
 end,
["src.main"] = function(...) 
local ____exports = {}
_G.update = function()
    tm.os:Log("Hello, world!")
end
local ____ = tm
return ____exports
 end,
}
return require("src.main", ...)
