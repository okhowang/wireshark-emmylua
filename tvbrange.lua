---@class TvbRange
---A TvbRange represents a usable range of a Tvb and is used to extract data from the Tvb that generated it.
---
---TvbRanges are created by calling a Tvb (e.g. 'tvb(offset,length)'). If the TvbRange span is outside the Tvb's range the creation will cause a runtime error.
local tvbrange = Class()

---Creates a new Tvb from a TvbRange.
---@return Tvb
function tvbrange:tvb()
end

---Get a Big Endian (network order) unsigned integer from a TvbRange. The range must be 1-4 octets long.
---@return number The unsigned integer value.
function tvbrange:uint()
end

---Get a Little Endian unsigned integer from a TvbRange. The range must be 1-4 octets long.
---@return number The unsigned integer value
function tvbrange:le_uint()
end

---Get a Big Endian (network order) unsigned 64 bit integer from a TvbRange, as a UInt64 object. The range must be 1-8 octets long.
---@return UInt64 The UInt64 object.
function tvbrange:uint64()
end

---Get a Little Endian unsigned 64 bit integer from a TvbRange, as a UInt64 object. The range must be 1-8 octets long.
---@return UInt64 The UInt64 object.
function tvbrange:le_uint64()
end

---Get a Big Endian (network order) signed integer from a TvbRange. The range must be 1-4 octets long.
---@return number The signed integer value.
function tvbrange:int()
end

---Get a Little Endian signed integer from a TvbRange. The range must be 1-4 octets long.
---@return number The signed integer value.
function tvbrange:le_int()
end

---Get a Big Endian (network order) signed 64 bit integer from a TvbRange, as an Int64 object. The range must be 1-8 octets long.
---@return Int64 The Int64 object.
function tvbrange:int64()
end

---Get a Little Endian signed 64 bit integer from a TvbRange, as an Int64 object. The range must be 1-8 octets long.
---@return Int64 The Int64 object.
function tvbrange:le_int64()
end

---Get a Big Endian (network order) floating point number from a TvbRange. The range must be 4 or 8 octets long.
---@return number The floating point value.
function tvbrange:float()
end

---Get a Little Endian floating point number from a TvbRange. The range must be 4 or 8 octets long.
---@return number The floating point value.
function tvbrange:le_float()
end

---Get an IPv4 Address from a TvbRange, as an Address object.
---@return Address The IPv4 Address object.
function tvbrange:ipv4()
end

---Get an Little Endian IPv4 Address from a TvbRange, as an Address object.
---@return Address The IPv4 Address object.
function tvbrange:le_ipv4()
end

---Get an IPv6 Address from a TvbRange, as an Address object.
---@return Address The IPv6 Address object.
function tvbrange:ipv6()
end

---Get an Ethernet Address from a TvbRange, as an Address object.
---@return Address The Ethernet Address object.
---Errors
---
---The range must be 6 bytes long
function tvbrange:ether()
end

--- Obtain a time_t structure from a TvbRange, as an NSTime object.
---@param encoding any optional. An optional ENC_* encoding value to use
---@return NSTime The NSTime object and number of bytes used, or nil on failure.
---Errors
---
---The range must be 4 or 8 bytes long
function tvbrange:nstime(encoding)
end

---Obtain a nstime from a TvbRange, as an NSTime object.
---@return NSTime The NSTime object.
---Errors
---
---The range must be 4 or 8 bytes long
function tvbrange:le_nstime()
end

---Obtain a string from a TvbRange.
---@param encoding any optional. The encoding to use. Defaults to ENC_ASCII.
---@return string A string containing all bytes in the TvbRange including all zeroes (e.g., "a\000bc\000").
function tvbrange:string(encoding)
end

---Obtain a Big Endian (network order) UTF-16 encoded string from a TvbRange.
---@return string A string containing all bytes in the TvbRange including all zeroes (e.g., "a\000bc\000").
function tvbrange:ustring()
end

---Obtain a Little Endian UTF-16 encoded string from a TvbRange.
---@return string A string containing all bytes in the TvbRange including all zeroes (e.g., "a\000bc\000").
function tvbrange:le_ustring()
end

---Obtain a zero terminated string from a TvbRange.
---@param encoding any optional. The encoding to use. Defaults to ENC_ASCII.
---@return string The string containing all bytes in the TvbRange up to the first terminating zero.
function tvbrange:stringz(encoding)
end

---Find the size of a zero terminated string from a TvbRange. The size of the string includes the terminating zero.
---
---Since: 1.11.3
---@param encoding any optional. The encoding to use. Defaults to ENC_ASCII.
---@return number Length of the zero terminated string.
function tvbrange:strsize(encoding)
end

---Obtain a Big Endian (network order) UTF-16 encoded zero terminated string from a TvbRange.
---@return any Two return values: the zero terminated string, and the length.
function tvbrange:ustringz()
end

---Obtain a Little Endian UTF-16 encoded zero terminated string from a TvbRange
---@return any Two return values: the zero terminated string, and the length.
function tvbrange:le_ustringz()
end

---Obtain a ByteArray from a TvbRange.
---
---Starting in 1.11.4, this function also takes an optional encoding argument, which can be set to ENC_STR_HEX to decode a hex-string from the TvbRange into the returned ByteArray. The encoding can be bitwise-or’ed with one or more separator encodings, such as ENC_SEP_COLON, to allow separators to occur between each pair of hex characters.
---
---The return value also now returns the number of bytes used as a second return value.
---
---On failure or error, nil is returned for both return values.
---
---Note
---
---The encoding type of the hex string should also be set, for example ENC_ASCII or ENC_UTF_8, along with ENC_STR_HEX.
---@param encoding any optional. An optional ENC_* encoding value to use
---@return ByteArray|nil The ByteArray object or nil, and number of bytes consumed or nil.
function tvbrange:bytes(encoding)
end

---Get a bitfield from a TvbRange.
---@param position number optional. The bit offset (MSB 0 bit numbering) from the beginning of the TvbRange. Defaults to 0.
---@param length number optional. The length in bits of the field. Defaults to 1.
---@return any The bitfield value
function tvbrange:bitfield(position, length)
end

---Creates a sub-TvbRange from this TvbRange.
---@param offset number optional. The offset (in octets) from the beginning of the TvbRange. Defaults to 0.
---@param length number optional. The length (in octets) of the range. Defaults to until the end of the TvbRange.
---@return TvbRange The TvbRange.
function tvbrange:range(offset, length)
end

---Obtain an uncompressed TvbRange from a TvbRange
---@param name string The name to be given to the new data-source.
---@return TvbRange The TvbRange.
function tvbrange:uncompress(name)
end

---Obtain the length of a TvbRange.
function tvbrange:len()
end

---Obtain the offset in a TvbRange.
function tvbrange:offset()
end

---Obtain a Lua string of the binary bytes in a TvbRange.
---
---Since: 1.11.3
---@param offset number optional. The position of the first byte. Default is 0, or first byte.
---@param length number optional. The length of the segment to get. Default is -1, Default is -1, or the remaining bytes.
---@return string A Lua string of the binary bytes in the TvbRange.
function tvbrange:raw(offset, length)
end

---Checks whether the contents of two TvbRanges are equal.
---
---Since: 1.99.8
function tvbrange:__eq()
end

---Converts the TvbRange into a string. The string can be truncated, so this is primarily useful for debugging or in cases where truncation is preferred, e.g. "67:89:AB:…​".
---
---@return string A Lua hex string of the TvbRange truncated to 24 bytes.
function tvbrange:__tostring()
end
