---@class Tvb
---A Tvb represents the packet’s buffer. It is passed as an argument to listeners and dissectors, and can be used to extract information (via TvbRange) from the packet’s data.
---
---To create a TvbRange the Tvb must be called with offset and length as optional arguments; the offset defaults to 0 and the length to tvb:len().
---
---[Warning]    Warning
---Tvbs are usable only by the current listener or dissector call and are destroyed as soon as the listener or dissector returns, so references to them are unusable once the function has returned.
local tvb = Class()

---Convert the bytes of a Tvb into a string. This is primarily useful for debugging purposes since the string will be truncated if it is too long.
---@return string The string.
function tvb:__tostring()
end

---Obtain the reported (not captured) length of a Tvb.
---@return number The reported length of the Tvb.
function tvb:reported_len()
end

---Obtain the actual (captured) length of a Tvb.
---@return number The captured length of the Tvb.
function tvb:len()
end

---Obtain the reported (not captured) length of packet data to end of a Tvb or -1 if the offset is beyond the end of the Tvb.
---@return number The captured length of the Tvb.
function tvb:reported_length_remaining()
end

---Obtain a ByteArray from a Tvb.
---
---Since: 1.99.8
---@param offset number optional. The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length number optional. The length (in octets) of the range. Defaults to until the end of the Tvb.
---@return ByteArray|nil The ByteArray object or nil.
function tvb:bytes(offset, length)
end

---Returns the raw offset (from the beginning of the source Tvb) of a sub Tvb.
---@return number The raw offset of the Tvb.
function tvb:offset()
end

---Equivalent to tvb:range(...)
function tvb:__call()
end

---Creates a TvbRange from this Tvb.
---@param offset number optional. The offset (in octets) from the beginning of the Tvb. Defaults to 0.
---@param length number optional. The length (in octets) of the range. Defaults to -1, which specifies the remaining bytes in the Tvb.
---@return TvbRange The TvbRange
function tvb:range(offset, length)
end

---Obtain a Lua string of the binary bytes in a Tvb.
---
---Since: 1.11.3
---@param offset number optional. The position of the first byte. Default is 0, or the first byte.
---@param length number optional. The length of the segment to get. Default is -1, or the remaining bytes in the Tvb.
---@return string A Lua string of the binary bytes in the Tvb.
function tvb:raw(offset, length)
end

---Checks whether contents of two Tvbs are equal.
---
---Since: 1.99.8
function tvb:__eq()
end
