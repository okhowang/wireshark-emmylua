---@class ProgDlg
---Creates and manages a modal progress bar. This is intended to be used with coroutines, where a main UI thread controls the progress bar dialog while a background coroutine (worker thread) yields to the main thread between steps. The main thread checks the status of the Cancel button and if it’s not set, returns control to the coroutine.
---
---The legacy (GTK+) user interface displayed this as a separate dialog, hence the “Dlg” suffix. The Qt user interface shows a progress bar inside the main status bar.
local ProgDlg = {}

---Creates and displays a new ProgDlg progress bar with a Cancel button and optional title. It is highly recommended that you wrap code that uses a ProgDlg instance because it does not automatically close itself upon encountering an error. Requires a GUI.
---Example
---
---if not gui_enabled() then return end
---
---local p = ProgDlg.new("Constructing", "tacos")
---
--- We have to wrap the ProgDlg code in a pcall in case some unexpected
---
--- error occurs.
---
---local ok, errmsg = pcall(function()
---
---local co = coroutine.create(
---
---function()
---
---local limit = 100000
---
---for i=1,limit do
---
---print("co", i)
---
---coroutine.yield(i/limit, "step "..i.." of "..limit)
---
---end
---
---end
---)
---
--- Whenever coroutine yields, check the status of the cancel button to determine
---
--- when to break. Wait up to 20 sec for coroutine to finish.
---
---local start_time = os.time()
---
---while coroutine.status(co) ~= 'dead' do
---
---local elapsed = os.time() - start_time
---
---- Quit if cancel button pressed or 20 seconds elapsed
---
---if p:stopped() or elapsed > 20 then
---
---break
---
---end
---
---local res, val, val2 = coroutine.resume(co)
---
---if not res or res == false then
---
---if val then
---
---debug(val)
---
---end
---
---print('coroutine error')
---
---break
---
---end
---
---- show progress in progress dialog
---
---p:update(val, val2)
---
---end
---
---end)
---
---p:close()
---
---if not ok and errmsg then
---
---report_failure(errmsg)
---
---end
---@param title string optional. Title of the progress bar. Defaults to "Progress".
---@param task string optional. Optional task name, which will be appended to the title. Defaults to the empty string ("").
---@return ProgDlg The newly created ProgDlg object.
function ProgDlg.new(title, task)
end

---Sets the progress dialog’s progress bar position based on percentage done.
---@param progress number Progress value, e.g. 0.75. Value must be between 0.0 and 1.0 inclusive.
---@param task string optional. Task name. Currently ignored. Defaults to empty string ("").
---Errors
---
---GUI not available
---
---Cannot be called for something not a ProgDlg
---
---Progress value out of range (must be between 0.0 and 1.0)
function ProgDlg:update(progress, task)
end

---Checks whether the user has pressed the Cancel button.
---@return boolean Boolean true if the user has asked to stop the operation, false otherwise.
function ProgDlg:stopped()
end

---Hides the progress bar.
---@return string A string specifying whether the Progress Dialog has stopped or not.
---Errors
---
---GUI not available
function ProgDlg:close()
end
