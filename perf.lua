---@class Pref
---A preference of a Proto.
local pref = Class()

---Creates a boolean preference to be added to a Proto.prefs Lua table.
---
---Example
---
---create a Boolean preference named "bar" for Foo Protocol
---
---(assuming Foo doesn't already have a preference named "bar")
---
---proto_foo.prefs.bar = Pref.bool( "Bar", true, "Baz and all the rest" )
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default any The default value for this preference.
---@param descr string A description of this preference.
local function PrefBool(label, default, descr)
end

---Creates an (unsigned) integer preference to be added to a Proto.prefs Lua table.
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default any The default value for this preference.
---@param descr string A description of what this preference is.
local function PrefUint(label, default, descr)
end

---Creates a string preference to be added to a Proto.prefs Lua table.
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default any The default value for this preference.
---@param descr string A description of what this preference is.
local function PrefString(label, default, descr)
end

---Creates an enum preference to be added to a Proto.prefs Lua table.
---
---11.6.3.6. Example:
---
---local OUTPUT_OFF        = 0
---
---local OUTPUT_DEBUG      = 1
---
---local OUTPUT_INFO       = 2
---
---local OUTPUT_WARN       = 3
---
---local OUTPUT_ERROR      = 4
---
---local output_tab = {
---
---{ 1, "Off"              , OUTPUT_OFF },
---
---{ 2, "Debug"            , OUTPUT_DEBUG },
---
---{ 3, "Information"      , OUTPUT_INFO },
---
---{ 4, "Warning"          , OUTPUT_WARN },
---
---{ 5, "Error"            , OUTPUT_ERROR },
---
---}
---
---Create enum preference that shows as Combo Box under
---
---Foo Protocol's preferences
---
---proto_foo.prefs.outputlevel = Pref.enum(
---
---"Output Level",                 -- label
---
---OUTPUT_INFO,                    -- default value
---
---"Verbosity of log output",      -- description
---
---output_tab,                     -- enum table
---
---false                           -- show as combo box
---
---)
---
---- Then, we can query the value of the selected preference.
---
---- This line prints "Output Level: 3" assuming the selected
---
---- output level is _INFO.
---
---debug( "Output Level: " .. proto_foo.prefs.outputlevel )
---
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default any The default value for this preference.
---@param descr string A description of what this preference is.
---@param enum table An enum Lua table.
---@param radio boolean Radio button (true) or Combobox (false).
local function PrefEnum(label, default, descr, enum, radio)
end

---Creates a range (numeric text entry) preference to be added to a Proto.prefs Lua table.
---@param label string The Label (text in the right side of the preference input) for this preference.
---@param default any The default value for this preference, e.g., "53", "10-30", or "10-30,53,55,100-120".
---@param descr string A description of what this preference is.
---@param max any The maximum value.
local function PrefRange(label, default, descr, max)
end

---Creates a static text string to be added to a Proto.prefs Lua table.
---@param label string The static text.
---@param descr string The static text description.
local function PrefStatictext(label, descr)
end

Perf = {
    bool = PrefBool,
    uint = PrefUint,
    string = PrefString,
    enum = PrefEnum,
    range = PrefRange,
    statictext = PrefStatictext,
}

---@class Prefs
---The table of preferences of a protocol.
local perfs = Class()

---Creates a new preference.
---@param name string The abbreviation of this preference.
---@param pref Pref A valid but still unassigned Pref object.
---Errors
---
---Unknown Pref type
function prefs:__newindex(name, pref)
end

---Get the value of a preference setting.
---
---Example
---
--- print the value of Foo's preference named "bar"
---
---debug( "bar = " .. proto_foo.prefs.bar )
---@param name string The abbreviation of this preference.
---@return Pref The current value of the preference.
---Errors
---
---Unknown Pref type
function prefs:__index(name)
end


