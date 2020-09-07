---@class Int64
---Int64 represents a 64 bit signed integer.
---
---Note the caveats listed above.
local int64 = Class()

---Decodes an 8-byte Lua string, using the given endianness, into a new Int64 object.
---
---Since: 1.11.3
---@param string string The Lua string containing a binary 64-bit integer.
---@param endian boolean optional. If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return Int64 The Int64 object created, or nil on failure.
local function Int64Decode(string, endian)
end

---Creates a Int64 Object.
---
---Since: 1.11.3
---@param value number|UInt64|Int64|string optional. A number, UInt64, Int64, or string of ASCII digits to assign the value of the new Int64. Default is 0.
---@param highvalue number optional. If this is a number and the first argument was a number, then the first will be treated as a lower 32 bits, and this is the high-order 32 bit number.
---@return Int64 The new Int64 object.
local function Int64New(value, highvalue)
end

---Creates an Int64 of the maximum possible positive value. In other words, this should return an Int64 object of the number 9,223,372,036,854,775,807.
---
---Since: 1.11.3
---@return Int64 The new Int64 object of the maximum value.
local function Int64Max()
end

---Creates an Int64 of the minimum possible negative value. In other words, this should return an Int64 object of the number -9,223,372,036,854,775,808.
---
---Since: 1.11.3
---@return Int64 The new Int64 object of the minimum value.
local function Int64Min()
end

---Creates an Int64 object from the given hexadecimal string.
---
---Since: 1.11.3
---@param hex string The hex-ASCII Lua string.
---@return Int64 The new Int64 object.
local function Int64Fromhex(hex)
end

Int64 = {
    decode = Int64Decode,
    new = Int64New,
    max = Int64Max,
    min = Int64Min,
    fromhex = Int64Fromhex,
}

---Encodes the Int64 number into an 8-byte Lua string using the given endianness.
---
---Since: 1.11.3
---@param endian boolean optional. If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return string The Lua string.
function int64:encode(endian)
end

---Creates a Int64 object.
---
---Since: 1.11.3
---@return Int64 The new Int64 object.
function int64:__call()
end

---Returns a Lua number of the Int64 value. Note that this may lose precision.
---
---Since: 1.11.3
---@return number The Lua number.
function int64:tonumber()
end

---Returns a hexadecimal string of the Int64 value.
---
---Since: 1.11.3
---@param numbytes number optional. The number of hex chars/nibbles to generate. A negative value generates uppercase. Default is 16.
---@return string The string hex.
function int64:tohex(numbytes)
end

---Returns a Lua number of the higher 32 bits of the Int64 value. A negative Int64 will return a negative Lua number.
---
---Since: 1.11.3
---@return number The Lua number.
function int64:higher()
end

---Returns a Lua number of the lower 32 bits of the Int64 value. This will always be positive.
---
---Since: 1.11.3
---@return number The Lua number.
function int64:lower()
end

---Converts the Int64 into a string of decimal digits.
---
---@return string The Lua string.
function int64:__tostring()
end

---Returns the negative of the Int64 as a new Int64.
---
---Since: 1.11.3
---@return Int64 The new Int64.
function int64:__unm()
end

---Adds two Int64 together and returns a new one. The value may wrapped.
---
---Since: 1.11.3
function int64:__add()
end

---Subtracts two Int64 and returns a new one. The value may wrapped.
---
---Since: 1.11.3
function int64:__sub()
end

---Multiplies two Int64 and returns a new one. The value may truncated.
---
---Since: 1.11.3
function int64:__mul()
end

---Divides two Int64 and returns a new one. Integer divide, no remainder. Trying to divide by zero results in a Lua error.
---
---Since: 1.11.3
---@return Int64 The Int64 object.
function int64:__div()
end

---Divides two Int64 and returns a new one of the remainder. Trying to modulo by zero results in a Lua error.
---
---Since: 1.11.3
---@return Int64 The Int64 object.
function int64:__mod()
end

---The first Int64 is taken to the power of the second Int64, returning a new one. This may truncate the value.
---
---Since: 1.11.3
---@return Int64 The Int64 object.
function int64:__pow()
end

---Returns true if both Int64 are equal.
---
---Since: 1.11.3
function int64:__eq()
end

---Returns true if first Int64 is less than the second.
---
---Since: 1.11.3
function int64:__lt()
end

---Returns true if the first Int64 is less than or equal to the second.
---
---Since: 1.11.3
function int64:__le()
end

---Returns a Int64 of the bitwise 'not' operation.
---
---Since: 1.11.3
---@return Int64 The Int64 object.
function int64:bnot()
end

---Returns a Int64 of the bitwise 'and' operation with the given number/Int64/UInt64. Note that multiple arguments are allowed.
---
---Since: 1.11.3
function int64:band()
end

---Returns a Int64 of the bitwise 'or' operation, with the given number/Int64/UInt64. Note that multiple arguments are allowed.
---
---Since: 1.11.3
function int64:bor()
end

---Returns a Int64 of the bitwise 'xor' operation, with the given number/Int64/UInt64. Note that multiple arguments are allowed.
---
---Since: 1.11.3
function int64:bxor()
end

---Returns a Int64 of the bitwise logical left-shift operation, by the given number of bits.
---
---Since: 1.11.3
---@param numbits number The number of bits to left-shift by.
---@return Int64 The Int64 object.
function int64:lshift(numbits)
end

---Returns a Int64 of the bitwise logical right-shift operation, by the given number of bits.
---
---Since: 1.11.3
---@param numbits number The number of bits to right-shift by.
---@return Int64 The Int64 object.
function int64:rshift(numbits)
end

---Returns a Int64 of the bitwise arithmetic right-shift operation, by the given number of bits.
---
---Since: 1.11.3
---@param numbits number The number of bits to right-shift by.
---@return Int64 The Int64 object.
function int64:arshift(numbits)
end

---Returns a Int64 of the bitwise left rotation operation, by the given number of bits (up to 63).
---
---Since: 1.11.3
---@param numbits number The number of bits to roll left by.
---@return Int64 The Int64 object.
function int64:rol(numbits)
end

---Returns a Int64 of the bitwise right rotation operation, by the given number of bits (up to 63).
---
---Since: 1.11.3
---@param numbits number The number of bits to roll right by.
---@return Int64 The Int64 object.
function int64:ror(numbits)
end

---Returns a Int64 of the bytes swapped. This can be used to convert little-endian 64-bit numbers to big-endian 64 bit numbers or vice versa.
---
---Since: 1.11.3
---@return Int64 The Int64 object.
function int64:bswap()
end

---@class UInt64
---UInt64 represents a 64 bit unsigned integer, similar to Int64.
---
---Note the caveats listed above.
local uint64 = Class()

---Decodes an 8-byte Lua binary string, using given endianness, into a new UInt64 object.
---
---Since: 1.11.3
---@param string string The Lua string containing a binary 64-bit integer.
---@param endian boolean optional. If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return UInt64 The UInt64 object created, or nil on failure.
local function UInt64Decode(string, endian)
end

---Creates a UInt64 Object.
---
---Since: 1.11.3
---@param value number|UInt64|Int64|string optional. A number, UInt64, Int64, or string of digits to assign the value of the new UInt64. Default is 0.
---@param highvalue number optional. If this is a number and the first argument was a number, then the first will be treated as a lower 32 bits, and this is the high-order 32-bit number.
---@return UInt64 The new UInt64 object.
local function UInt64New(value, highvalue)
end

---Creates a UInt64 of the maximum possible value. In other words, this should return an UInt64 object of the number 18,446,744,073,709,551,615.
---
---Since: 1.11.3
---@return UInt64 The maximum value.
local function UInt64Max()
end

---Creates a UInt64 of the minimum possible value. In other words, this should return an UInt64 object of the number 0.
---
---Since: 1.11.3
---@return UInt64 The minimum value.
local function UInt64Min()
end

---Creates a UInt64 object from the given hex string.
---
---Since: 1.11.3
---@param hex string The hex-ASCII Lua string.
---@return UInt64 The new UInt64 object.
local function UInt64Fromhex(hex)
end

Uint64 = {
    decode = UInt64Decode,
    new = UInt64New,
    max = UInt64Max,
    min = UInt64Min,
    fromhex = UInt64Fromhex,
}

---Encodes the UInt64 number into an 8-byte Lua binary string, using given endianness.
---
---Since: 1.11.3
---@param endian boolean optional. If set to true then little-endian is used, if false then big-endian; if missing or nil, native host endian.
---@return string The Lua binary string.
function uint64:encode(endian)
end

---Creates a UInt64 object.
---
---Since: 1.11.3
---@return UInt64 The new UInt64 object.
function uint64:__call()
end

---Returns a Lua number of the UInt64 value. This may lose precision.
---
---Since: 1.11.3
---@return number The Lua number.
function uint64:tonumber()
end

---Converts the UInt64 into a string.
---@return string The Lua string.
function uint64:__tostring()
end

---Returns a hex string of the UInt64 value.
---
---Since: 1.11.3
---@param numbytes number optional. The number of hex-chars/nibbles to generate. Negative means uppercase Default is 16.
---@return string The string hex.
function uint64:tohex(numbytes)
end

---Returns a Lua number of the higher 32 bits of the UInt64 value.
---@return number The Lua number.
function uint64:higher()
end

---Returns a Lua number of the lower 32 bits of the UInt64 value.
---@return number The Lua number.
function uint64:lower()
end

---Returns the UInt64 in a new UInt64, since unsigned integers can’t be negated.
---
---Since: 1.11.3
---@return UInt64 The UInt64 object.
function uint64:__unm()
end

---Adds two UInt64 together and returns a new one. This may wrap the value.
---
---Since: 1.11.3
function uint64:__add()
end

---Subtracts two UInt64 and returns a new one. This may wrap the value.
---
---Since: 1.11.3
function uint64:__sub()
end

---Multiplies two UInt64 and returns a new one. This may truncate the value.
---
---Since: 1.11.3
function uint64:__mul()
end

---Divides two UInt64 and returns a new one. Integer divide, no remainder. Trying to divide by zero results in a Lua error.
---
---Since: 1.11.3
---@return UInt64 The UInt64 result.
function uint64:__div()
end

---Divides two UInt64 and returns a new one of the remainder. Trying to modulo by zero results in a Lua error.
---
---Since: 1.11.3
---@return UInt64 The UInt64 result.
function uint64:__mod()
end

---The first UInt64 is taken to the power of the second UInt64/number, returning a new one. This may truncate the value.
---
---Since: 1.11.3
---@return UInt64 The UInt64 object.
function uint64:__pow()
end

---Returns true if both UInt64 are equal.
---
---Since: 1.11.3
function uint64:__eq()
end

---Returns true if first UInt64 is less than the second.
---
---Since: 1.11.3
function uint64:__lt()
end

---Returns true if first UInt64 is less than or equal to the second.
---
---Since: 1.11.3
function uint64:__le()
end

---Returns a UInt64 of the bitwise 'not' operation.
---
---Since: 1.11.3
---@return UInt64 The UInt64 object.
function uint64:bnot()
end

---Returns a UInt64 of the bitwise 'and' operation, with the given number/Int64/UInt64. Note that multiple arguments are allowed.
---
---Since: 1.11.3
function uint64:band()
end

---Returns a UInt64 of the bitwise 'or' operation, with the given number/Int64/UInt64. Note that multiple arguments are allowed.
---
---Since: 1.11.3
function uint64:bor()
end

---Returns a UInt64 of the bitwise 'xor' operation, with the given number/Int64/UInt64. Note that multiple arguments are allowed.
---
---Since: 1.11.3
function uint64:bxor()
end

---Returns a UInt64 of the bitwise logical left-shift operation, by the given number of bits.
---
---Since: 1.11.3
---@param numbits number The number of bits to left-shift by.
---@return UInt64 The UInt64 object.
function uint64:lshift(numbits)
end

---Returns a UInt64 of the bitwise logical right-shift operation, by the given number of bits.
---
---Since: 1.11.3
---@param numbits number The number of bits to right-shift by.
---@return UInt64 The UInt64 object.
function uint64:rshift(numbits)
end

---Returns a UInt64 of the bitwise arithmetic right-shift operation, by the given number of bits.
---
---Since: 1.11.3
---@param numbits number The number of bits to right-shift by.
---@return UInt64 The UInt64 object.
function uint64:arshift(numbits)
end

---Returns a UInt64 of the bitwise left rotation operation, by the given number of bits (up to 63).
---
---Since: 1.11.3
---@param numbits number The number of bits to roll left by.
---@return UInt64 The UInt64 object.
function uint64:rol(numbits)
end

---Returns a UInt64 of the bitwise right rotation operation, by the given number of bits (up to 63).
---
---Since: 1.11.3
---@param numbits number The number of bits to roll right by.
---@return UInt64 The UInt64 object.
function uint64:ror(numbits)
end

---Returns a UInt64 of the bytes swapped. This can be used to convert little-endian 64-bit numbers to big-endian 64 bit numbers or vice versa.
---
---Since: 1.11.3
---@return UInt64 The UInt64 object.
function uint64:bswap()
end
