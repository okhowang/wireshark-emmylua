---@class File
---A File object, passed into Lua as an argument by FileHandler callback functions (e.g., read_open, read, write, etc.). This behaves similarly to the Lua io library’s file object, returned when calling io.open(), except in this case you cannot call file:close(), file:open(), nor file:setvbuf(), since Wireshark/tshark manages the opening and closing of files. You also cannot use the “io” library itself on this object, i.e. you cannot do io.read(file, 4). Instead, use this File with the object-oriented style calling its methods, i.e. myfile:read(4). (see later example)
---
---The purpose of this object is to hide the internal complexity of how Wireshark handles files, and instead provide a Lua interface that is familiar, by mimicking the io library. The reason true/raw io files cannot be used is because Wireshark does many things under the hood, such as compress the file, or write to stdout, or various other things based on configuration/commands.
---
---When a File object is passed in through reading-based callback functions, such as read_open(), read(), and read_close(), then the File object’s write() and flush() functions are not usable and will raise an error if used.
---
---When a File object is passed in through writing-based callback functions, such as write_open(), write(), and write_close(), then the File object’s read() and lines() functions are not usable and will raise an error if used.
---
---Note: A File object should never be stored/saved beyond the scope of the callback function it is passed in to.
---
---For example:
---
---function myfilehandler.read_open(file, capture)
---local position = file:seek()
---
----- read 24 bytes
---local line = file:read(24)
---
----- do stuff
---
----- it's not our file type, seek back (unnecessary but just to show it...)
---file:seek("set",position)
---
----- return false because it's not our file type
---return false
---end
---Since: 1.11.3
---@field compressed boolean Mode: Retrieve only. Whether the File is compressed or not. See wtap_encaps in init.lua for available types. Set to wtap_encaps.PER_PACKET if packets can have different types, then later set FrameInfo.encap for each packet during read()/seek_read().
File = {}
---Reads from the File, similar to Lua’s file:read(). See Lua 5.x ref manual for file:read().
---@see file#read
function File:read()
end

---Seeks in the File, similar to Lua’s file:seek(). See Lua 5.x ref manual for file:seek().
---@see file#seek
---@return number The current file cursor position as a number.
function File:seek()
end

---Lua iterator function for retrieving ASCII File lines, similar to Lua’s file:lines(). See Lua 5.x ref manual for file:lines().
---@see file#lines
function File:lines()
end

---Writes to the File, similar to Lua’s file:write(). See Lua 5.x ref manual for file:write().
---@see file#write
function File:write()
end

---Generates a string of debug info for the File object
---@return string String of debug information.
function File:__tostring()
end
