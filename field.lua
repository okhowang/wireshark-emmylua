---Create a Field extractor.
---@param fieldname string The filter name of the field (e.g. ip.addr)
---@return Field The field extractor
---A Field extractor must be defined before Taps or Dissectors get called
local function FieldNew(fieldname)
end

---Gets a Lua array table of all registered field filter names.
---
---Note: This is an expensive operation, and should only be used for troubleshooting.
---
---Since: 1.11.3
---@return table The array table of field filter names
local function FieldList()
end

Field = {
    new = FieldNew,
    list = FieldList,
}

---@class Field
---A Field extractor to obtain field values. A Field object can only be created outside of the callback functions of dissectors, post-dissectors, heuristic-dissectors, and taps.
---
---Once created, it is used inside the callback functions, to generate a FieldInfo object.
---@field name string|nil Mode: Retrieve only. The filter name of this field, or nil. Since: 1.99.8
---@field display string|nil Mode: Retrieve only. The full display name of this field, or nil. Since: 1.99.8
---@field type any Mode: Retrieve only. The ftype of this field, or nil. Since: 1.99.8
local field = Class()

---Obtain all values (see FieldInfo) for this field.
---@return any All the values of this field
---Fields cannot be used outside dissectors or taps
function field:__call()
end

---Obtain a string with the field filter name.
function field:__tostring()
end
---@class FieldInfo
---An extracted Field from dissected packet data. A FieldInfo object can only be used within the callback functions of dissectors, post-dissectors, heuristic-dissectors, and taps.
---
---A FieldInfo can be called on either existing Wireshark fields by using either Field.new() or Field() before-hand, or it can be called on new fields created by Lua from a ProtoField.
---@field len number Mode: Retrieve only. The length of this field.
---@field offset number Mode: Retrieve only. The offset of this field.
---@field value any Mode: Retrieve only. The value of this field.
---@field label string Mode: Retrieve only. The string representing this field.
---@field display string Mode: Retrieve only. The string display of this field as seen in GUI.
---@field type any Mode: Retrieve only. The internal field type, a number which matches one of the ftype values in init.lua. Since: 1.99.8
---@field source Tvb Mode: Retrieve only. The source Tvb object the FieldInfo is derived from, or nil if there is none. Since: 1.99.8
---@field range TvbRange Mode: Retrieve only. The TvbRange covering the bytes of this field in a Tvb.
---@field generated boolean Mode: Retrieve only. Whether this field was marked as generated (boolean).
---@field hidden boolean Mode: Retrieve only. Whether this field was marked as hidden (boolean). Since: 1.99.8
---@field is_url boolean Mode: Retrieve only. Whether this field was marked as being a URL (boolean). Since: 1.99.8
---@field little_endian boolean Mode: Retrieve only. Whether this field is little-endian encoded (boolean). Since: 1.99.8
---@field big boolean Mode: Retrieve only. Whether this field is big-endian encoded (boolean). Since: 1.99.8
---@field name string Mode: Retrieve only. The filter name of this field. Since: 1.99.8
local fieldinfo = Class()

---Obtain the Length of the field
function fieldinfo:__len()
end

---Obtain the Offset of the field
function fieldinfo:__unm()
end

---Obtain the Value of the field.
---Previous to 1.11.4, this function retrieved the value for most field types, but for ftypes.UINT_BYTES it retrieved the ByteArray of the field’s entire TvbRange. In other words, it returned a ByteArray that included the leading length byte(s), instead of just the value bytes. That was a bug, and has been changed in 1.11.4. Furthermore, it retrieved an ftypes.GUID as a ByteArray, which is also incorrect.
---
---If you wish to still get a ByteArray of the TvbRange, use FieldInfo:get_range() to get the TvbRange, and then use Tvb:bytes() to convert it to a ByteArray.
function fieldinfo:__call()
end

---The string representation of the field.
function fieldinfo:__tostring()
end

---Checks whether lhs is within rhs.
function fieldinfo:__eq()
end

---Checks whether the end byte of lhs is before the end of rhs.
---Data source must be the same for both fields
function fieldinfo:__le()
end

---Checks whether the end byte of rhs is before the beginning of rhs.
---Data source must be the same for both fields
function fieldinfo:__lt()
end

---Obtain all fields from the current tree. Note this only gets whatever fields the underlying dissectors have filled in for this packet at this time - there may be fields applicable to the packet that simply aren’t being filled in because at this time they’re not needed for anything. This function only gets what the C-side code has currently populated, not the full list.
---
---Cannot be called outside a listener or dissector
function all_field_infos()
end
