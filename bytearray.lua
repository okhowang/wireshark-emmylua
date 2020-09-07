---@class ByteArray
local bytearray = Class()

---Creates a new ByteArray object.
---
---Starting in version 1.11.3, if the second argument is a boolean true, then the first argument is treated as a raw Lua string of bytes to use, instead of a hexadecimal string.
---
---Example
---
---local empty = ByteArray.new()
---
---local b1 = ByteArray.new("a1 b2 c3 d4")
---
---local b2 = ByteArray.new("112233")
---@param hexbytes string optional. A string consisting of hexadecimal bytes like "00 B1 A2" or "1a2b3c4d".
---@param separator string optional. A string separator between hex bytes/words (default=" "), or if the boolean value true is used, then the first argument is treated as raw binary data
---@return ByteArray The new ByteArray object.
local function ByteArrayNew(hexbytes, separator)
end

ByteArray = {
    new = ByteArrayNew
}

---Concatenate two ByteArrays.
---@param first ByteArray First array.
---@param second ByteArray Second array.
---@return ByteArray The new composite ByteArray.
function bytearray:__concat(first, second)
end
---Compares two ByteArray values.
---
---Since: 1.11.4
---@param first ByteArray First array.
---@param second ByteArray Second array.
function bytearray:__eq(first, second)
end

---Prepend a ByteArray to this ByteArray.
---@param prepended ByteArray ByteArray to be prepended.
function bytearray:prepend(prepended)
end

---Append a ByteArray to this ByteArray.
---@param appended ByteArray ByteArray to be appended.
function bytearray:append(appended)
end

---Sets the size of a ByteArray, either truncating it or filling it with zeros.
---@param size number New size of the array.
---Errors
---
---ByteArray size must be non-negative
function bytearray:set_size(size)
end

---Sets the value of an index of a ByteArray.
---@param index number The position of the byte to be set.
---@param value number The char value to set [0-255].
function bytearray:set_index(index, value)
end

---Get the value of a byte in a ByteArray.
---@param index number The position of the byte to get.
---@return number The value [0-255] of the byte.
function bytearray:get_index(index)
end

---Obtain the length of a ByteArray.
---@return number The length of the ByteArray.
function bytearray:len()
end

---Obtain a segment of a ByteArray, as a new ByteArray.
---@param offset number The position of the first byte (0=first).
---@param length number The length of the segment.
---@return ByteArray A ByteArray containing the requested segment.
function bytearray:subset(offset, length)
end

---Obtain a Base64 decoded ByteArray.
---
---Since: 1.11.3
---@return ByteArray The created ByteArray.
function bytearray:base64_decode()
end

---Obtain a Lua string of the binary bytes in a ByteArray.
---
---Since: 1.11.3
---@param offset number optional. The position of the first byte (default=0/first).
---@param length number optional. The length of the segment to get (default=all).
---@return string A Lua string of the binary bytes in the ByteArray.
function bytearray:raw(offset, length)
end

---Obtain a Lua string of the bytes in a ByteArray as hex-ascii, with given separator
---
---Since: 1.11.3
---@param lowercase boolean optional. True to use lower-case hex characters (default=false).
---@param separator string optional. A string separator to insert between hex bytes (default=nil).
---@return string A hex-ascii string representation of the ByteArray.
function bytearray:tohex(lowercase, separator)
end

---Obtain a Lua string containing the bytes in a ByteArray so that it can be used in display filters (e.g. "01FE456789AB").
---@return string A hex-ascii string representation of the ByteArray.
function bytearray:__tostring()
end

---Creates a new Tvb from a ByteArray. The Tvb will be added to the current frame.
---
--- Example
---
---function proto_foo.dissector(buf, pinfo, tree)
---
--- Create a new tab named "My Tvb" and add some data to it
---
---local b = ByteArray.new("11223344")
---
---local tvb = ByteArray.tvb(b, "My Tvb")
---
--- Create a tree item that, when clicked, automatically shows the tab we just created
---
---tree:add( tvb(1,2), "Foo" )
---
---end
---
---@param name string The name to be given to the new data source.
---@return Tvb The created Tvb.
function bytearray:tvb(name)
end
