
---Creates a new DissectorTable for your dissector’s use.
---@param tablename string The short name of the table. Use lower-case alphanumeric, dot, and/or underscores (e.g., "ansi_map.tele_id" or "udp.port").
---@param uniname string optional. The name of the table in the user interface. Defaults to the name given in tablename, but can be any string.
---@param type Ftype optional. One of ftypes.UINT8, ftypes.UINT16, ftypes.UINT24, ftypes.UINT32, or ftypes.STRING. Defaults to ftypes.UINT32.
---@param base Base optional. One of base.NONE, base.DEC, base.HEX, base.OCT, base.DEC_HEX or base.HEX_DEC. Defaults to base.DEC.
---@param proto Proto optional. The Proto object that uses this dissector table.
---@return dissectortable The newly created DissectorTable.
local function DissectorTableNew(tablename, uniname, type, base, proto)
end

---Gets a Lua array table of all DissectorTable names - i.e., the string names you can use for the first argument to DissectorTable.get().
---
---Note: This is an expensive operation, and should only be used for troubleshooting.
---
---Since: 1.11.3
---@return table The array table of registered DissectorTable names.
local function DissectorTableList()
end

---Gets a Lua array table of all heuristic list names - i.e., the string names you can use for the first argument in Proto:register_heuristic().
---
---Note: This is an expensive operation, and should only be used for troubleshooting.
---
---Since: 1.11.3
---@return table The array table of registered heuristic list names
local function DissectorTableHeuristicList()
end

---Obtain a reference to an existing dissector table.
---@param tablename string The short name of the table.
---@return dissectortable The DissectorTable.
local function DissectorTableGet(tablename)
end

---A table of subdissectors of a particular protocol (e.g. TCP subdissectors like http, smtp, sip are added to table "tcp.port").
---
---Useful to add more dissectors to a table so that they appear in the “Decode As…​” dialog.
---@class dissectortable
local dissectortable = Class()

DissectorTable = {
    new = DissectorTableNew,
    list = DissectorTableList,
    heuristic_list = DissectorTableHeuristicList,
    get = DissectorTableGet,
}

---Add a Proto with a dissector function or a Dissector object to the dissector table.
---@param pattern any The pattern to match (either an integer, a integer range or a string depending on the table’s type).
---@param dissector Proto|Dissector The dissector to add (either a Proto or a Dissector).
function dissectortable:add(pattern, dissector)
end

---Clear all existing dissectors from a table and add a new dissector or a range of new dissectors.
---
---Since: 1.11.3
---@param pattern any The pattern to match (either an integer, a integer range or a string depending on the table’s type).
---@param dissector Proto|Dissector The dissector to add (either a Proto or a Dissector).
function dissectortable:set(pattern, dissector)
end

---Remove a dissector or a range of dissectors from a table.
---@param pattern any The pattern to match (either an integer, a integer range or a string depending on the table’s type).
---@param dissector Proto|Dissector The dissector to add (either a Proto or a Dissector).
function dissectortable:remove(pattern, dissector)
end

---Remove all dissectors from a table.
---
---Since: 1.11.3
---@param dissector Proto|Dissector The dissector to add (either a Proto or a Dissector).
function dissectortable:remove_all(dissector)
end

---Try to call a dissector from a table.
---@param pattern any The pattern to be matched (either an integer or a string depending on the table’s type).
---@param tvb Tvb The Tvb to dissect.
---@param pinfo Pinfo The packet’s Pinfo.
---@param tree TreeItem The TreeItem on which to add the protocol items.
---@return number Number of bytes dissected. Note that some dissectors always return number of bytes in incoming buffer, so be aware.
function dissectortable:try(pattern, tvb, pinfo, tree)
end

---Try to obtain a dissector from a table.
---@param pattern any The pattern to be matched (either an integer or a string depending on the table’s type).
---@return Dissector|nil The Dissector handle if found, otherwise nil
function dissectortable:get_dissector(pattern)
end

---Add the given Proto to the "Decode as..." list for this DissectorTable. The passed-in Proto object’s dissector() function is used for dissecting.
---
---Since: 1.99.1
---@param proto Proto The Proto to add.
function dissectortable:add_for_decode_as(proto)
end

---Gets some debug information about the DissectorTable.
---@return string A string of debug information about the DissectorTable.
function dissectortable:__tostring()
end
