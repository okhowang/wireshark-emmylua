---@class NSTime
---NSTime represents a nstime_t. This is an object with seconds and nanoseconds.
---@field secs number Mode: Retrieve or assign. The NSTime seconds.
---@field nsecs number Mode: Retrieve or assign. The NSTime nano seconds.
local nstime = Class()

---Creates a new NSTime object.
---@param seconds number optional. Seconds.
---@param seconds number optional. Nano seconds.
---@return NSTime The new NSTime object.
local function NSTimeNew(seconds, nseconds)
end

NSTime = {
    new = NSTimeNew
}

---Creates a NSTime object.
---@param seconds number optional. Seconds.
---@param nseconds number optional. Nanoseconds.
---@return NSTime The new NSTime object.
function nstime:__call(seconds, nseconds)
end

---Returns a Lua number of the NSTime representing seconds from epoch
---@return number The Lua number.
---Since: 2.4.0
function nstime:tonumber()
end

---@return string The string representing the nstime.
function nstime:__tostring()
end

---Calculates the sum of two NSTimes.
function nstime:__add()
end

---Calculates the diff of two NSTimes.
function nstime:__sub()
end

---Calculates the negative NSTime.
function nstime:__unm()
end

---Compares two NSTimes.
function nstime:__eq()
end

---Compares two NSTimes.
function nstime:__le()
end

---Compares two NSTimes.
function nstime:__lt()
end

