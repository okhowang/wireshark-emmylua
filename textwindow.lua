---@class TextWindow
---Creates and manages a text window. The text can be read-only or editable, and buttons can be added below the text.
local TextWindow = {}

---Creates a new TextWindow text window and displays it. Requires a GUI.
---
---11.3.2.2. Example
---if not gui_enabled() then return end
---
----- create new text window and initialize its text
---local win = TextWindow.new("Log")
---win:set("Hello world!")
---
----- add buttons to clear text window and to enable editing
---win:add_button("Clear", function() win:clear() end)
---win:add_button("Enable edit", function() win:set_editable(true) end)
---
----- add button to change text to uppercase
---win:add_button("Uppercase", function()
---local text = win:get_text()
---if text ~= "" then
---win:set(string.upper(text))
---end
---end)
---
----- print "closing" to stdout when the user closes the text windw
---win:set_atclose(function() print("closing") end)
---@param title string optional. Title of the new window. Optional. Defaults to "Untitled Window".
---@return TextWindow The newly created TextWindow object.
---Errors
---GUI not available
function TextWindow.new(title)
end
---Set the function that will be called when the text window closes.
---@param action function A Lua function to be executed when the user closes the text window.
---@return TextWindow The TextWindow object.
---Errors
---GUI not available
function TextWindow:set_atclose(action)
end
---Sets the text to be displayed.
---@param text string The text to be displayed.
---@return TextWindow The TextWindow object.
---Errors
---GUI not available
function TextWindow:set(text)
end
---Appends text to the current window contents.
---@param text string The text to be appended.
---@return TextWindow The TextWindow object.
---Errors
---GUI not available
function TextWindow:append(text)
end
---Prepends text to the current window contents.
---@param text string The text to be prepended.
---@return TextWindow The TextWindow object.
---Errors
---GUI not available
function TextWindow:prepend(text)
end
---Erases all of the text in the window.
---@return TextWindow The TextWindow object.
---Errors
---GUI not available
function TextWindow:clear()
end
---Get the text of the window.
---@return TextWindow The `TextWindow’s text.
---Errors
---GUI not available
function TextWindow:get_text()
end
---Close the window.
---Errors
---GUI not available
function TextWindow:close()
end
---Make this text window editable.
---@param editable boolean optional. true to make the text editable, false otherwise. Defaults to true.
---@return TextWindow The TextWindow object.
---Errors
---GUI not available
function TextWindow:set_editable(editable)
end
---Adds a button with an action handler to the text window.
---@param label string The button label.
---@param funca function The Lua function to be called when the button is pressed.
---@return TextWindow The TextWindow object.
---Errors
---GUI not available
function TextWindow:add_button(label, func)
end
