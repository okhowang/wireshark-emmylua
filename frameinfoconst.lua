---@class FrameInfoConst
---A constant FrameInfo object, passed into Lua as an argument by the FileHandler write callback function. This has similar attributes/properties as FrameInfo, but the fields can only be read from, not written to.
---
---Since: 1.11.3
---@param time NSTime Mode: Retrieve only. The packet timestamp as an NSTime object.
---@param data any Mode: Retrieve only. The data buffer containing the packet.
---@param rec_type any Mode: Retrieve only. The record type of the packet frame - see wtap_presence_flags in init.lua for values.
---@param flags any Mode: Retrieve only. The presence flags of the packet frame - see wtap_presence_flags in init.lua for bits.
---@param captured_length number Mode: Retrieve only. The captured packet length, and thus the length of the buffer in the FrameInfoConst.data field.
---@param original_length number Mode: Retrieve only. The on-the-wire packet length, which may be longer than the captured_length.
---@param encap any Mode: Retrieve only. The packet encapsulation type, if the file supports per-packet types. See wtap_encaps in init.lua for possible packet encapsulation types to use as the value for this field.
---@param comment string Mode: Retrieve only. A comment for the packet; nil if there is none.
FrameInfoConst = {}

---Generates a string of debug info for the FrameInfo
---@return string String of debug information.
function FrameInfoConst:__tostring()
end

---Tells Wireshark to write directly to given file from the frame data buffer, for length bytes. Returns true if succeeded, else false.
---@param file File The File object userdata, provided by Wireshark previously in a writing-based callback.
---@param length number optional. The number of bytes to write to the file at the current cursor position, or all if not supplied.
---@return boolean True if succeeded, else returns false along with the error number and string error description.
function FrameInfoConst:write_data(file, length)
end

