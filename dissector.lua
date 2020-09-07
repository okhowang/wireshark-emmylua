--- A refererence to a dissector, used to call a dissector against a packet or a part of it.
---@class Dissector
local dissector = Class()

---Obtains a dissector reference by name.
---@param name string The name of the dissector.
---@return Dissector The Dissector reference.
local function DissectorGet(name)
end

---Gets a Lua array table of all registered Dissector names.
---
---Note: This is an expensive operation, and should only be used for troubleshooting.
---
---Since: 1.11.3
---@return table The array table of registered dissector names.
local function DissectorList()
end

Dissector = {
    get = DissectorGet,
    list = DissectorList,
}

---Calls a dissector against a given packet (or part of it).
---@param tvb Tvb The buffer to dissect.
---@param pinfo Pinfo The packet info.
---@param tree TreeItem The tree on which to add the protocol items.
---@return number Number of bytes dissected. Note that some dissectors always return number of bytes in incoming buffer, so be aware.
function dissector:call(tvb, pinfo, tree)
end

---Calls a dissector against a given packet (or part of it).
---@param tvb Tvb The buffer to dissect.
---@param pinfo Pinfo The packet info.
---@param tree TreeItem The tree on which to add the protocol items.
function dissector:__call(tvb, pinfo, tree)
end

---Gets the Dissector’s protocol short name.
---@return string A string of the protocol’s short name.
function dissector:__tostring()
end
