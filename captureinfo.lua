---@class CaptureInfo
---A CaptureInfo object, passed into Lua as an argument by FileHandler callback function read_open(), read(), seek_read(), seq_read_close(), and read_close(). This object represents capture file data and meta-data (data about the capture file) being read into Wireshark/Tshark.
---
---This object’s fields can be written-to by Lua during the read-based function callbacks. In other words, when the Lua plugin’s FileHandler.read_open() function is invoked, a CaptureInfo object will be passed in as one of the arguments, and its fields should be written to by your Lua code to tell Wireshark about the capture.
---
---Since: 1.11.3
---@field encap any Mode: Retrieve or assign. The packet encapsulation type for the whole file. See wtap_encaps in init.lua for available types. Set to wtap_encaps.PER_PACKET if packets can have different types, then later set FrameInfo.encap for each packet during read()/seek_read().
---@field time_precision any Mode: Retrieve or assign. The precision of the packet timestamps in the file. See wtap_file_tsprec in init.lua for available precisions.
---@field snapshot_length number Mode: Retrieve or assign. The maximum packet length that could be recorded. Setting it to 0 means unknown.
---@field comment string Mode: Retrieve or assign. A string comment for the whole capture file, or nil if there is no comment.
---@field hardware string Mode: Retrieve or assign. A string containing the description of the hardware used to create the capture, or nil if there is no hardware string.
---@field os string Mode: Retrieve or assign. A string containing the name of the operating system used to create the capture, or nil if there is no os string.
---@field user_app string Mode: Retrieve or assign. A string containing the name of the application used to create the capture, or nil if there is no user_app string.
---@field hosts any Mode: Assign only. Sets resolved ip-to-hostname information. The value set must be a Lua table of two key-ed names: ipv4_addresses and ipv6_addresses. The value of each of these names are themselves array tables, of key-ed tables, such that the inner table has a key addr set to the raw 4-byte or 16-byte IP address Lua string and a name set to the resolved name. For example, if the capture file identifies one resolved IPv4 address of 1.2.3.4 to foo.com, then you must set CaptureInfo.hosts to a table of: { ipv4_addresses = { { addr = "\01\02\03\04", name = "foo.com" } } } Note that either the ipv4_addresses or the ipv6_addresses table, or both, may be empty or nil.
---@field private_table any Mode: Retrieve or assign. A private Lua value unique to this file. The private_table is a field you set/get with your own Lua table. This is provided so that a Lua script can save per-file reading/writing state, because multiple files can be opened and read at the same time. For example, if the user issued a reload-file command, or Lua called the reload() function, then the current capture file is still open while a new one is being opened, and thus Wireshark will invoke read_open() while the previous capture file has not caused read_close() to be called; and if the read_open() succeeds then read_close() will be called right after that for the previous file, rather than the one just opened. Thus the Lua script can use this private_table to store a table of values specific to each file, by setting this private_table in the read_open() function, which it can then later get back inside its read(), seek_read(), and read_close() functions.
CaptureInfo = {}

---Generates a string of debug info for the CaptureInfo
---@return string String of debug information.
function CaptureInfo:__tostring()
end





