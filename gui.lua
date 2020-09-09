---Checks if we’re running inside a GUI (i.e. Wireshark) or not.
---@return boolean Boolean true if a GUI is available, false if it isn’t.
function gui_enabled()
end

---@class Menu
local menu = menu

---@type Menu
MENU_STAT_UNSORTED = Statistics
---@type Menu
MENU_STAT_GENERIC = Statistics
---@type Menu
MENU_STAT_CONVERSATION = Statistics
---@type Menu
MENU_STAT_ENDPOINT = Statistics
---@type Menu
MENU_STAT_RESPONSE = Statistics
---@type Menu
MENU_STAT_TELEPHONY= Telephony
---@type Menu
MENU_STAT_TELEPHONY_ANSI= Telephony
---@type Menu
MENU_STAT_TELEPHONY_GSM= Telephony
---@type Menu
MENU_STAT_TELEPHONY_LTE= Telephony
---@type Menu
MENU_STAT_TELEPHONY_MTP3= Telephony
---@type Menu
MENU_STAT_TELEPHONY_SCTP= Telephony
---@type Menu
MENU_ANALYZE= Analyze
---@type Menu
MENU_ANALYZE_CONVERSATION= Analyze
---@type Menu
MENU_TOOLS_UNSORTED= Tools

---Register a menu item in one of the main menus. Requires a GUI.
---@param name string The name of the menu item. Use slashes to separate submenus. (e.g. Lua Scripts → My Fancy Statistics). (string)
---@param action function The function to be called when the menu item is invoked. The function must take no arguments and return nothing.
---@param group any optional. Where to place the item in the menu hierarchy. If omitted, defaults to MENU_STAT_GENERIC. One of: MENU_STAT_UNSORTED: Statistics, MENU_STAT_GENERIC: Statistics, first section, MENU_STAT_CONVERSATION: Statistics → Conversation List, MENU_STAT_ENDPOINT: Statistics → Endpoint List, MENU_STAT_RESPONSE: Statistics → Service Response Time, MENU_STAT_TELEPHONY: Telephony, MENU_STAT_TELEPHONY_ANSI: Telephony → ANSI, MENU_STAT_TELEPHONY_GSM: Telephony → GSM, MENU_STAT_TELEPHONY_LTE: Telephony → LTE, MENU_STAT_TELEPHONY_MTP3: Telephony → MTP3, MENU_STAT_TELEPHONY_SCTP: Telephony → SCTP, MENU_ANALYZE: Analyze, MENU_ANALYZE_CONVERSATION: Analyze → Conversation Filter, MENU_TOOLS_UNSORTED: Tools
function register_menu(name, action, group)
end
---Displays a dialog, prompting for input. The dialog includes an OK button and Cancel button. Requires a GUI.
---
---Example
---if not gui_enabled() then return end
---
----- Prompt for IP and port and then print them to stdout
---local label_ip = "IP address"
---local label_port = "Port"
---local function print_ip(ip, port)
---print(label_ip, ip)
---print(label_port, port)
---end
---new_dialog("Enter IP address", print_ip, label_ip, label_port)
---
----- Prompt for 4 numbers and then print their product to stdout
---new_dialog(
---"Enter 4 numbers",
---function (a, b, c, d) print(a * b * c * d) end,
---"a", "b", "c", "d"
---)
---@param title string The title of the dialog.
---@param action function Action to be performed when the user presses OK.
---…​
---Strings to be used a labels of the dialog’s fields. Each string creates a new labeled field. The first field is required.
---Errors
---GUI not available
---At least one field required
---All fields must be strings
function new_dialog(title, action, …​)
end
---Rescans all packets and runs each tap listener without reconstructing the display.
function retap_packets()
end

---Copy a string into the clipboard. Requires a GUI.
---@param text string The string to be copied into the clipboard.
function copy_to_clipboard(text)
end
---Open and display a capture file. Requires a GUI.
---@param filename string The name of the file to be opened.
---@param filter string The display filter to be applied once the file is opened.
function open_capture_file(filename, filter)
end
---Get the main filter text.
function get_filter()
end

---Set the main filter text.
---@param text string The filter’s text.
function set_filter(text)
end
---Gets the current packet coloring rule (by index) for the current session. Wireshark reserves 10 slots for these coloring rules. Requires a GUI.
---@param row number The index (1-10) of the desired color filter value in the temporary coloring rules list.
function get_color_filter_slot(row)
end

---Sets a packet coloring rule (by index) for the current session. Wireshark reserves 10 slots for these coloring rules. Requires a GUI.
---@param row number The index (1-10) of the desired color in the temporary coloring rules list. The default foreground is black and the default backgrounds are listed below.
---The color list can be set from the command line using two unofficial preferences: gui.colorized_frame.bg and gui.colorized_frame.fg, which require 10 hex RGB codes (6 hex digits each), e.g.
---
---wireshark -o gui.colorized_frame.bg:${RGB0},${RGB1},${RGB2},${RGB3},${RGB4},${RGB5},${RGB6},${RGB7},${RGB8},${RGB9}
---
---For example, this command yields the same results as the table above (and with all foregrounds set to black):
---
---wireshark -o gui.colorized_frame.bg:ffc0c0,ffc0ff,e0c0e0,c0c0ff,c0e0e0,c0ffff,c0ffc0,ffffc0,e0e0c0,e0e0e0 -o gui.colorized_frame.fg:000000,000000,000000,000000,000000,000000,000000,000000
---@param text string The display filter for selecting packets to be colorized .
function set_color_filter_slot(row, text)
end
---Apply the filter in the main filter box. Requires a GUI.
---
---Warning
---
---Avoid calling this from within a dissector function or else an infinite loop can occur if it causes the dissector to be called again. This function is best used in a button callback (from a dialog or text window) or menu callback.
function apply_filter()
end

---Reload the current capture file. Deprecated. Use reload_packets() instead.
function reload()
end


---Reload the current capture file. Requires a GUI.
---
---Warning
---
---Avoid calling this from within a dissector function or else an infinite loop can occur if it causes the dissector to be called again. This function is best used in a button callback (from a dialog or text window) or menu callback.
function reload_packets()
end

---Reload all Lua plugins.
function reload_lua_plugins()
end

---Opens an URL in a web browser. Requires a GUI.
---@param url string The url.
function browser_open_url(url)
end

---Open a file located in the data directory (specified in the Wireshark preferences) in the web browser. If the file does not exist, the function silently ignores the request. Requires a GUI.
---@param filename string The file name.
function browser_open_data_file(filename)
end
