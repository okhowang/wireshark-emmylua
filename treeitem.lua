---@class TreeItem
---<lua_class_TreeItem,TreeItem>>s represent information in the packet details pane of Wireshark, and the packet details view of Tshark. A TreeItem represents a node in the tree, which might also be a subtree and have a list of children. The children of a subtree have zero or more siblings which are other children of the same TreeItem subtree.
---
---During dissection, heuristic-dissection, and post-dissection, a root <lua_class_TreeItem,TreeItem>> is passed to dissectors as the third argument of the function callback (e.g., myproto.dissector(tvbuf,pktinfo,root)).
---
---In some cases the tree is not truly added to, in order to improve performance. For example for packets not currently displayed/selected in Wireshark’s visible window pane, or if Tshark isn’t invoked with the -V switch. However the "add" type TreeItem functions can still be called, and still return TreeItem objects - but the info isn’t really added to the tree. Therefore you do not typically need to worry about whether there’s a real tree or not. If, for some reason, you need to know it, you can use the TreeItem.visible attribute getter to retrieve the state.
---@field text string Mode: Retrieve or assign. Set/get the TreeItem's display string (string). For the getter, if the TreeItem has no display string, then nil is returned. Since: 1.99.3
---@field visible boolean Mode: Retrieve only. Get the TreeItem's subtree visibility status (boolean). Since: 1.99.8
---@field generated boolean Mode: Retrieve or assign. Set/get the TreeItem's generated state (boolean). Since: 1.99.8
---@field hidden boolean Mode: Retrieve or assign. Set/get TreeItem's hidden state (boolean). Since: 1.99.8
---@field len number Mode: Retrieve or assign. Set/get TreeItem's length inside tvb, after it has already been created. Since: 1.99.8
local treeitem = Class()

---Adds a new child tree for the given ProtoField object to this tree item, returning the new child TreeItem.
---
---Unlike TreeItem:add() and TreeItem:add_le(), the ProtoField argument is not optional, and cannot be a Proto object. Instead, this function always uses the ProtoField to determine the type of field to extract from the passed-in TvbRange, highlighting the relevant bytes in the Packet Bytes pane of the GUI (if there is a GUI), etc. If no TvbRangeis given, no bytes are highlighted and the field’s value cannot be determined; the ProtoField must have been defined/created not to have a length in such a case, or an error will occur. For backwards-compatibility reasons the encoding argument, however, must still be given.
---
---Unlike TreeItem:add() and TreeItem:add_le(), this function performs both big-endian and little-endian decoding, by setting the encoding argument to be ENC_BIG_ENDIAN or ENC_LITTLE_ENDIAN.
---
---The signature of this function:
---
---tree_item:add_packet_field(proto_field [,tvbrange], encoding, ...)
---
---In Wireshark version 1.11.3, this function was changed to return more than just the new child TreeItem. The child is the first return value, so that function chaining will still work as before; but it now also returns the value of the extracted field (i.e., a number, UInt64, Address, etc.). If the value could not be extracted from the TvbRange, the child TreeItem is still returned, but the second returned value is nil.
---
---Another new feature added to this function in Wireshark version 1.11.3 is the ability to extract native number ProtoField`s from string encoding in the `TvbRange, for ASCII-based and similar string encodings. For example, a ProtoField of as ftypes.UINT32 type can be extracted from a TvbRange containing the ASCII string "123", and it will correctly decode the ASCII to the number 123, both in the tree as well as for the second return value of this function. To do so, you must set the encoding argument of this function to the appropriate string ENC_* value, bitwise-or’d with the ENC_STRING value (see init.lua). ENC_STRING is guaranteed to be a unique bit flag, and thus it can added instead of bitwise-or’ed as well. Only single-byte ASCII digit string encoding types can be used for this, such as ENC_ASCII and ENC_UTF_8.
---
---For example, assuming the Tvb named “tvb” contains the string "123":
---
--- this is done earlier in the script
---
---local myfield = ProtoField.new("Transaction ID", "myproto.trans_id", ftypes.UINT16)
---
--- this is done inside a dissector, post-dissector, or heuristic function
---
--- child will be the created child tree, and value will be the number 123 or nil on failure
---
---local child, value = tree:add_packet_field(myfield, tvb:range(0,3), ENC_UTF_8 + ENC_STRING)
---@param protofield ProtoField The ProtoField field object to add to the tree.
---@param tvbrange TvbRange optional. The TvbRange of bytes in the packet this tree item covers/represents.
---@param encoding any The field’s encoding in the TvbRange.
---@param label any optional, One or more strings to append to the created TreeItem.
---@return TreeItem The new child TreeItem, the field’s extracted value or nil, and offset or nil.
function treeitem:add_packet_field(protofield, tvbrange, encoding, label)
end

---Adds a child item to this tree item, returning the new child TreeItem.
---
---If the ProtoField represents a numeric value (int, uint or float), then it’s treated as a Big Endian (network order) value.
---
---This function has a complicated form: 'treeitem:add([protofield,] [tvbrange,] value], label)', such that if the first argument is a ProtoField or a Proto, the second argument is a TvbRange, and a third argument is given, it’s a value; but if the second argument is a non-TvbRange, then it’s the value (as opposed to filling that argument with 'nil', which is invalid for this function). If the first argument is a non-ProtoField and a non-Proto then this argument can be either a TvbRange or a label, and the value is not in use.
---
---Example
---local proto_foo = Proto("foo", "Foo Protocol")
---proto_foo.fields.bytes = ProtoField.bytes("foo.bytes", "Byte array")
---proto_foo.fields.u16 = ProtoField.uint16("foo.u16", "Unsigned short", base.HEX)
---
---function proto_foo.dissector(buf, pinfo, tree)
----- ignore packets less than 4 bytes long
---if buf:len() < 4 then return end
---
----- ##############################################
----- # Assume buf(0,4) == {0x00, 0x01, 0x00, 0x02}
----- ##############################################
---
---local t = tree:add( proto_foo, buf() )
---
----- Adds a byte array that shows as: "Byte array: 00010002"
---t:add( proto_foo.fields.bytes, buf(0,4) )
---
----- Adds a byte array that shows as "Byte array: 313233"
----- (the ASCII char code of each character in "123")
---t:add( proto_foo.fields.bytes, buf(0,4), "123" )
---
----- Adds a tree item that shows as: "Unsigned short: 0x0001"
---t:add( proto_foo.fields.u16, buf(0,2) )
---
----- Adds a tree item that shows as: "Unsigned short: 0x0064"
---t:add( proto_foo.fields.u16, buf(0,2), 100 )
---
----- Adds a tree item that shows as: "Unsigned short: 0x0064 ( big endian )"
---t:add( proto_foo.fields.u16, buf(1,2), 100, nil, "(", nil, "big", 999, nil, "endian", nil, ")" )
---
----- LITTLE ENDIAN: Adds a tree item that shows as: "Unsigned short: 0x0100"
---t:add_le( proto_foo.fields.u16, buf(0,2) )
---
----- LITTLE ENDIAN: Adds a tree item that shows as: "Unsigned short: 0x6400"
---t:add_le( proto_foo.fields.u16, buf(0,2), 100 )
---
----- LITTLE ENDIAN: Adds a tree item that shows as: "Unsigned short: 0x6400 ( little endian )"
---t:add_le( proto_foo.fields.u16, buf(1,2), 100, nil, "(", nil, "little", 999, nil, "endian", nil, ")" )
---end
---
---udp_table = DissectorTable.get("udp.port")
---udp_table:add(7777, proto_foo)
---@param protofield ProtoField optional. The ProtoField field or Proto protocol object to add to the tree.
---@param tvbrange TvbRange optional. The TvbRange of bytes in the packet this tree item covers/represents.
---@param value any optional. The field’s value, instead of the ProtoField/Proto one.
---@param label any optional. One or more strings to use for the tree item label, instead of the ProtoField/Proto one.
---@return TreeItem The new child TreeItem.
function treeitem:add(protofield, tvbrange, value, label)
end

---Adds a child item to this tree item, returning the new child TreeItem.
---
---If the ProtoField represents a numeric value (int, uint or float), then it’s treated as a Little Endian value.
---
---This function has a complicated form: 'treeitem:add_le([protofield,] [tvbrange,] value], label)', such that if the first argument is a ProtoField or a Proto, the second argument is a TvbRange, and a third argument is given, it’s a value; but if the second argument is a non-TvbRange, then it’s the value (as opposed to filling that argument with 'nil', which is invalid for this function). If the first argument is a non-ProtoField and a non-Proto then this argument can be either a TvbRange or a label, and the value is not in use.
---@param protofield ProtoField optional. The ProtoField field or Proto protocol object to add to the tree.
---@param tvbrange TvbRange optional. The TvbRange of bytes in the packet this tree item covers/represents.
---@param value any optional. The field’s value, instead of the ProtoField/Proto one.
---@param label any optional. One or more strings to use for the tree item label, instead of the ProtoField/Proto one.
---@return TreeItem The new child TreeItem.
function treeitem:add_le(protofield, tvbrange, value, label)
end

---Sets the text of the label.
---
---This used to return nothing, but as of 1.11.3 it returns the same tree item to allow chained calls.
---
---@param text string The text to be used.
---@return TreeItem The same TreeItem.
function treeitem:set_text(text)
end

---Appends text to the label.
---
---This used to return nothing, but as of 1.11.3 it returns the same tree item to allow chained calls.
---@param text string The text to be appended.
---@return TreeItem The same TreeItem.
function treeitem:append_text(text)
end

---Prepends text to the label.
---
---This used to return nothing, but as of 1.11.3 it returns the same tree item to allow chained calls.
---@param text string The text to be prepended.
---@return TreeItem The same TreeItem.
function treeitem:prepend_text(text)
end

---Sets the expert flags of the item and adds expert info to the packet.
---
---This function does not create a truly filterable expert info for a protocol. Instead you should use TreeItem.add_proto_expert_info().
---
---Note: This function is provided for backwards compatibility only, and should not be used in new Lua code. It may be removed in the future. You should only use TreeItem.add_proto_expert_info().
---@param group any optional. One of PI_CHECKSUM, PI_SEQUENCE, PI_RESPONSE_CODE, PI_REQUEST_CODE, PI_UNDECODED, PI_REASSEMBLE, PI_MALFORMED or PI_DEBUG.
---@param severity any optional. One of PI_CHAT, PI_NOTE, PI_WARN, or PI_ERROR.
---@param text string optional. The text for the expert info display.
---@return TreeItem The same TreeItem.
function treeitem:add_expert_info(group, severity, text)
end

---Sets the expert flags of the tree item and adds expert info to the packet.
---
---Since: 1.11.3
---@param expert ProtoExpert The ProtoExpert object to add to the tree.
---@param text string optional. Text for the expert info display (default is to use the registered text).
---@return TreeItem The same TreeItem.
function treeitem:add_proto_expert_info(expert, text)
end

---Sets the expert flags of the tree item and adds expert info to the packet associated with the Tvb or TvbRange bytes in the packet.
---
---Since: 1.11.3
---@param expert ProtoExpert The ProtoExpert object to add to the tree.
---@param tvb Tvb The Tvb or TvbRange object bytes to associate the expert info with.
---@param text string optional. Text for the expert info display (default is to use the registered text).
---@return TreeItem The same TreeItem.
function treeitem:add_tvb_expert_info(expert, tvb, text)
end

---Marks the TreeItem as a generated field (with data inferred but not contained in the packet).
---
---This used to return nothing, but as of 1.11.3 it returns the same tree item to allow chained calls.
---@param bool boolean optional, A Lua boolean, which if true sets the TreeItem generated flag, else clears it (default=true)
---@return TreeItem The same TreeItem.
function treeitem:set_generated(bool)
end

---Marks the TreeItem as a hidden field (neither displayed nor used in filters). Deprecated
---
---This used to return nothing, but as of 1.11.3 it returns the same tree item to allow chained calls.
---@param bool boolean optional. A Lua boolean, which if true sets the TreeItem hidden flag, else clears it. Default is true.
---@return TreeItem The same TreeItem.
function treeitem:set_hidden(bool)
end

---Set TreeItem's length inside tvb, after it has already been created.
---
---This used to return nothing, but as of 1.11.3 it returns the same tree item to allow chained calls.
---@param len number The length to be used.
---@return TreeItem The same TreeItem.
function treeitem:set_len(len)
end

---Checks if a ProtoField or Dissector is referenced by a filter/tap/UI.
---
---If this function returns false, it means that the field (or dissector) does not need to be dissected and can be safely skipped. By skipping a field rather than dissecting it, the dissector will usually run faster since Wireshark will not do extra dissection work when it doesn’t need the field.
---
---You can use this in conjunction with the TreeItem.visible attribute. This function will always return TRUE when the TreeItem is visible. When it is not visible and the field is not referenced, you can speed up the dissection by not dissecting the field as it is not needed for display or filtering.
---
---This function takes one parameter that can be a ProtoField or Dissector. The Dissector form is useful when you need to decide whether to call a sub-dissector.
---
---Since: 2.4.0
---@param protofield ProtoField The ProtoField or Dissector to check if referenced.
---@return boolean A boolean indicating if the ProtoField/Dissector is referenced
function treeitem:referenced(protofield)
end

---Returns string debug information about the TreeItem.
---
---Since: 1.99.8
function treeitem:__tostring()
end

