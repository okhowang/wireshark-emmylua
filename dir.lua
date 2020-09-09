---@class Dir
---A Directory object, as well as associated functions.
Dir = {}

---Creates a directory.
---
---The created directory is set for permission mode 0755 (octal), meaning it is read+write+execute by owner, but only read+execute by group members and others.
---
---If the directory was created successfully, a boolean true is returned. If the directory cannot be made because it already exists, false is returned. If the directory cannot be made because an error occurred, nil is returned.
---
---Since: 1.11.3
---@param name string The name of the directory, possibly including path.
---@return boolean Boolean true on success, false if the directory already exists, nil on error.
function Dir.make(name)
end

---Returns true if the given directory name exists.
---
---If the directory exists, a boolean true is returned. If the path is a file instead, false is returned. If the path does not exist or an error occurred, nil is returned.
---
---Since: 1.11.3
---@param name string The name of the directory, possibly including path.
---@return boolean Boolean true if the directory exists, false if it’s a file, nil on error or not-exist.
function Dir.exists(name)
end

---Removes an empty directory.
---
---If the directory was removed successfully, a boolean true is returned. If the directory cannot be removed because it does not exist, false is returned. If the directory cannot be removed because an error occurred, nil is returned.
---
---This function only removes empty directories. To remove a directory regardless, use Dir.remove_all().
---
---Since: 1.11.3
---@param name string The name of the directory, possibly including path.
---@return boolean Boolean true on success, false if does not exist, nil on error.
function Dir.remove(name)
end

---Removes an empty or non-empty directory.
---
---If the directory was removed successfully, a boolean true is returned. If the directory cannot be removed because it does not exist, false is returned. If the directory cannot be removed because an error occurred, nil is returned.
---
---Since: 1.11.3
---@param name string The name of the directory, possibly including path.
---@return boolean Boolean true on success, false if does not exist, nil on error.
function Dir.remove_all(name)
end

---Opens a directory and returns a Dir object representing the files in the directory.

---11.10.2. Example
----- Print the contents of a directory
---for filename in Dir.open('/path/to/dir') do
---print(filename)
---end
---@param pathname string The pathname of the directory.
---@param extension any optional If given, only files with this extension will be returned.
---@return Dir The Dir object.
function Dir.open(pathname, extension)
end

---Gets the personal configuration directory path, with filename if supplied.
---
---Since: 1.11.3
---@param filename string optional. A filename.
---@return string The full pathname for a file in the personal configuration directory.
function Dir.personal_config_path(filename)
end

---Gets the global configuration directory path, with filename if supplied.
---
---Since: 1.11.3
---@param filename string optional. A filename
---@return string The full pathname for a file in Wireshark’s configuration directory.
function Dir.global_config_path(filename)
end

---Gets the personal plugins directory path.
---
---Since: 1.11.3
---@return string The pathname of the personal plugins directory.
function Dir.personal_plugins_path()
end

---Gets the global plugins directory path.
---
---Since: 1.11.3
---@return string The pathname of the global plugins directory.
function Dir.global_plugins_path()
end

---Gets the next file or subdirectory within the directory, or nil when done.
---
---11.10.3. Example
----- Open a directory and print the name of the first file or subdirectory
---local dir = Dir.open('/path/to/dir')
---local first = dir()
---print(tostring(file))
function Dir:__call()
end

---Closes the directory. Called automatically during garbage collection of a Dir object.
function Dir:close()
end
