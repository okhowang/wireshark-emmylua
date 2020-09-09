---@class Struct
Struct = {}
---Returns a string containing the values arg1, arg2, etc. packed/encoded according to the format string.
---@param format string The format string
---@vararg any One or more Lua value(s) to encode, based on the given format.
---@return string The packed binary Lua string, plus any positions due to '=' being used in format.
function Struct.pack(format, ...)
end

---Unpacks/decodes multiple Lua values from a given struct-like binary Lua string. The number of returned values depends on the format given, plus an additional value of the position where it stopped reading is returned.
---@param format string The format string
---@param struct string The binary Lua string to unpack
---@param begin number optional. The position to begin reading from (default=1)
---@return any One or more values based on format, plus the position it stopped unpacking.
function Struct.unpack(format, struct, begin)
end

---Returns the length of a binary string that would be consumed/handled by the given format string.
---@param format string The format string
---@return number The size number
function Struct.size(format)
end

---Returns the number of Lua values contained in the given format string. This will be the number of returned values from a call to Struct.unpack() not including the extra return value of offset position. (i.e., Struct.values() does not count that extra return value) This will also be the number of arguments Struct.pack() expects, not including the format string argument.
---@param format string The format string
---@param number The number of values
function Struct.values(format)
end

---Converts the passed-in binary string to a hex-ascii string.
---@param bytestring string A Lua string consisting of binary bytes
---@param lowercase boolean optional. True to use lower-case hex characters (default=false).
---@param separator string optional. A string separator to insert between hex bytes (default=nil).
---@return string The Lua hex-ascii string
function Struct.tohex(bytestring, lowercase, separator)
end

---Converts the passed-in hex-ascii string to a binary string.
---@param hexbytes string A string consisting of hexadecimal bytes like "00 B1 A2" or "1a2b3c4d"
---@param separator string optional. A string separator between hex bytes/words (default none).
---@return string The Lua binary string
function Struct.fromhex(hexbytes, separator)
end
