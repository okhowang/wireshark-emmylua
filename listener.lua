---@class Listener
---A Listener is called once for every packet that matches a certain filter or has a certain tap. It can read the tree, the packet’s Tvb buffer as well as the tapped data, but it cannot add elements to the tree.
---@field packet function Mode: Assign only. A function that will be called once every packet matches the Listener listener filter. When later called by Wireshark, the packet function will be given: A Pinfo object A Tvb object A tapinfo table function tap.packet(pinfo,tvb,tapinfo) ... end Note tapinfo is a table of info based on the `Listener’s type, or nil.
---@field draw function Mode: Assign only. A function that will be called once every few seconds to redraw the GUI objects; in Tshark this funtion is called only at the very end of the capture file. When later called by Wireshark, the draw function will not be given any arguments. function tap.draw() ... end
---@field reset function Mode: Assign only. A function that will be called at the end of the capture run. When later called by Wireshark, the reset function will not be given any arguments. function tap.reset() ... end
local listener = Class()

---Creates a new Listener tap object.
---@param tap string optional. The name of this tap. See Listener.list() for a way to print valid listener names.
---@param filter any optional. A display filter to apply to the tap. The tap.packet function will be called for each matching packet. The default is nil, which matches every packet. Example: "m2tp".
---@param allfields boolean optional. Whether to generate all fields. The default is false. Note: This impacts performance.
---@return Listener The newly created Listener listener object
---Errors: tap registration error
local function ListenerNew(tap, filter, allfields)
end

---Gets a Lua array table of all registered Listener tap names.
---
---Note: This is an expensive operation, and should only be used for troubleshooting.
---
---Since: 1.11.3
---@return table The array table of registered tap names
local function ListenerList()
end

Listener = {
    new = ListenerNew,
    list = ListenerList,
}

---Removes a tap Listener.
function listener:remove()
end

---Generates a string of debug info for the tap Listener.
function listener:__tostring()
end
