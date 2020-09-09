---Gets the Wireshark version as a string.
---
---@return string The version string, e.g. "3.2.5".
function get_version()
end

---Set a Lua table with meta-data about the plugin, such as version.
---
---The passed-in Lua table entries need to be keyed/indexed by the following:
---
---"version" with a string value identifying the plugin version (required)
---"description" with a string value describing the plugin (optional)
---"author" with a string value of the author’s name(s) (optional)
---"repository" with a string value of a URL to a repository (optional)
---Not all of the above key entries need to be in the table. The 'version' entry is required, however. The others are not currently used for anything, but might be in the future and thus using them might be useful. Table entries keyed by other strings are ignored, and do not cause an error.
---
---11.11.1.3. Example
---local my_info = {
---version = "1.0.1",
---author = "Jane Doe",
---repository = "https://github.com/octocat/Spoon-Knife"
---}
---
---set_plugin_info(my_info)
---Since: 1.99.8
---@param table table The Lua table of information.
function set_plugin_info(table)
end

---Formats an absolute timestamp into a human readable date.
---@param timestamp any A timestamp value to convert.
---@return string A string with the formated date
function format_date(timestamp)
end

---Formats a relative timestamp in a human readable time.
---@param timestamp any A timestamp value to convert.
---@return string A string with the formated time
function format_time(timestamp)
end

---Reports a failure to the user.
---@param text string Message text to report.
function report_failure(text)
end

---Loads a Lua file and compiles it into a Lua chunk, similar to the standard loadfile but searches additional directories. The search order is the current directory, followed by the user’s personal configuration directory, and finally the global configuration directory.
---
---11.11.1.8. Example
----- Assume foo.lua contains definition for foo(a,b). Load the chunk
----- from the file and execute it to add foo(a,b) to the global table.
----- These two lines are effectively the same as dofile('foo.lua').
---local loaded_chunk = assert(loadfile('foo.lua'))
---loaded_chunk()
---
----- ok to call foo at this point
---foo(1,2)
---@param filename string Name of the file to be loaded. If the file does not exist in the current directory, the user and system directories are searched.
function loadfile(filename)
end

---Loads a Lua file and executes it as a Lua chunk, similar to the standard dofile but searches additional directories. The search order is the current directory, followed by the user’s personal configuration directory, and finally the global configuration directory.
---
---@param filename string Name of the file to be run. If the file does not exist in the current directory, the user and system directories are searched.
function dofile(filename)
end

---Register a function to handle a -z option
---@param argument string The name of the option argument.
---@param action function optional. The function to be called when the command is invoked.
function register_stat_cmd_arg(argument, action)
end

