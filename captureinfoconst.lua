---@class CaptureInfoConst
---A CaptureInfoConst object, passed into Lua as an argument to the FileHandler callback function write_open().
---
---This object represents capture file data and meta-data (data about the capture file) for the current capture in Wireshark/Tshark.
---
---This object’s fields are read-from when used by write_open function callback. In other words, when the Lua plugin’s FileHandler write_open function is invoked, a CaptureInfoConst object will be passed in as one of the arguments, and its fields should be read from by your Lua code to get data about the capture that needs to be written.
---
---Since: 1.11.3
---@field type any Mode: Retrieve only. The file type.
---@field snapshot_length number Mode: Retrieve only. The maximum packet length that is actually recorded (vs. the original length of any given packet on-the-wire). A value of 0 means the snapshot length is unknown or there is no one such length for the whole file.
---@field encap any Mode: Retrieve only. The packet encapsulation type for the whole file. See wtap_encaps in init.lua for available types. It is set to wtap_encaps.PER_PACKET if packets can have different types, in which case each Frame identifies its type, in FrameInfo.packet_encap.
---@field comment string Mode: Retrieve or assign. A comment for the whole capture file, if the wtap_presence_flags.COMMENTS was set in the presence flags; nil if there is no comment.
---@field hardware string Mode: Retrieve only. A string containing the description of the hardware used to create the capture, or nil if there is no hardware string.
---@field os string Mode: Retrieve only. A string containing the name of the operating system used to create the capture, or nil if there is no os string.
---@field user_app string Mode: Retrieve only. A string containing the name of the application used to create the capture, or nil if there is no user_app string.
---@field hosts any Mode: Retrieve only. A ip-to-hostname Lua table of two key-ed names: ipv4_addresses and ipv6_addresses. The value of each of these names are themselves array tables, of key-ed tables, such that the inner table has a key addr set to the raw 4-byte or 16-byte IP address Lua string and a name set to the resolved name. For example, if the current capture has one resolved IPv4 address of 1.2.3.4 to foo.com, then getting CaptureInfoConst.hosts will get a table of: { ipv4_addresses = { { addr = "\01\02\03\04", name = "foo.com" } }, ipv6_addresses = { } } Note that either the ipv4_addresses or the ipv6_addresses table, or both, may be empty, however they will not be nil.
---@field private_table any Mode: Retrieve or assign. A private Lua value unique to this file. The private_table is a field you set/get with your own Lua table. This is provided so that a Lua script can save per-file reading/writing state, because multiple files can be opened and read at the same time. For example, if two Lua scripts issue a Dumper:new_for_current() call and the current file happens to use your script’s writer, then the Wireshark will invoke write_open() while the previous capture file has not had write_close() called. Thus the Lua script can use this private_table to store a table of values specific to each file, by setting this private_table in the write_open() function, which it can then later get back inside its write(), and write_close() functions.
CaptureInfoConst = {}

---Generates a string of debug info for the CaptureInfoConst
---@return string String of debug information.
function CaptureInfoConst:__tostring()
end
