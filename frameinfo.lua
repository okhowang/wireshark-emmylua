---@class FrameInfo
---A FrameInfo object, passed into Lua as an argument by FileHandler callback functions (e.g., read, seek_read, etc.).
---
---This object represents frame data and meta-data (data about the frame/packet) for a given read/seek_read/`write’s frame.
---
---This object’s fields are written-to/set when used by read function callbacks, and read-from/get when used by file write function callbacks. In other words, when the Lua plugin’s FileHandler read/seek_read/etc. functions are invoked, a FrameInfo object will be passed in as one of the arguments, and its fields should be written-to/set based on the frame information read from the file; whereas when the Lua plugin’s FileHandler.write() function is invoked, the FrameInfo object passed in should have its fields read-from/get, to write that frame information to the file.
---
---Since: 1.11.3
---@field time NSTime Mode: Retrieve or assign. The packet timestamp as an NSTime object. Note: Set the FileHandler.time_precision to the appropriate wtap_file_tsprec value as well.
---@field data any Mode: Retrieve or assign. The data buffer containing the packet. [Note]    Note This cannot be cleared once set.
---@field rec_type any Mode: Retrieve or assign. The record type of the packet frame See wtap_rec_types in init.lua for values.
---@field flags any Mode: Retrieve or assign. The presence flags of the packet frame. See wtap_presence_flags in init.lua for bit values.
---@field captured_length number Mode: Retrieve or assign. The captured packet length, and thus the length of the buffer passed to the FrameInfo.data field.
---@field original_length number Mode: Retrieve or assign. The on-the-wire packet length, which may be longer than the captured_length.
---@field encap any Mode: Retrieve or assign. The packet encapsulation type for the frame/packet, if the file supports per-packet types. See wtap_encaps in init.lua for possible packet encapsulation types to use as the value for this field.
---@field comment string Mode: Retrieve or assign. A string comment for the packet, if the wtap_presence_flags.COMMENTS was set in the presence flags; nil if there is no comment.
FrameInfo = {}

---Generates a string of debug info for the FrameInfo
---@return string String of debug information.
function FrameInfo:__tostring()
end

---Tells Wireshark to read directly from given file into frame data buffer, for length bytes. Returns true if succeeded, else false.
---@param file File The File object userdata, provided by Wireshark previously in a reading-based callback.
---@param length number The number of bytes to read from the file at the current cursor position.
---@return boolean,string True if succeeded, else returns false along with the error number and string error description. A Lua string of the frame buffer’s data.
function FrameInfo:read_data(file, length)
end

