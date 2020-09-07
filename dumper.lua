---Creates a file to write packets. Dumper:new_for_current() will probably be a better choice.
---@param filename string The name of the capture file to be created.
---@param filetype number optional. The type of the file to be created - a number entry from the wtap_filetypes table in init.lua.
---@param encap number optional. The encapsulation to be used in the file to be created - a number entry from the wtap_encaps table in init.lua.
---@return Dumper The newly created Dumper object
local function DumperNew(filename, filetype, encap)
end

Dumper = {
    new = DumperNew
}

---@class Dumper
local dumper = Class()

---Closes a dumper.
---
---Cannot operate on a closed dumper
function dumper:close()
end

---Writes all unsaved data of a dumper to the disk.
function dumper:flush()
end

---Dumps an arbitrary packet. Note: Dumper:dump_current() will fit best in most cases.
---@param timestamp any The absolute timestamp the packet will have.
---@param pseudoheader PseudoHeader The PseudoHeader to use.
---@param bytearray ByteArray The data to be saved
function dumper:dump(timestamp, pseudoheader, bytearray)
end

---Creates a capture file using the same encapsulation as the one of the current packet.
---@param filetype any The file type. Defaults to pcap.
---@return Dumper The newly created Dumper Object
---Cannot be used outside a tap or a dissector
function dumper:new_for_current(filetype)
end

---Dumps the current packet as it is.
---
---Cannot be used outside a tap or a dissector
function dumper:dump_current()
end
