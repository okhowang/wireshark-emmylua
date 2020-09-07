---@class Proto
---A new protocol in Wireshark. Protocols have several uses. The main one is to dissect a protocol, but they can also be dummies used to register preferences for other purposes.
---@field dissector function Mode: Retrieve or assign. The protocol’s dissector, a function you define. When later called, the function will be given: A Tvb object A Pinfo object A TreeItem object
---@field prefs Prefs Mode: Retrieve only. The preferences of this dissector.
---@field prefs_changed function Mode: Assign only. The preferences changed routine of this dissector, a Lua function you define.
---@field init function Mode: Assign only. The init routine of this dissector, a function you define. The called init function is passed no arguments.
---@field name string Mode: Retrieve only. The name given to this dissector.
---@field description string Mode: Retrieve only. The description given to this dissector.
---@field fields table Mode: Retrieve or assign. The `ProtoField`s Lua table of this dissector.
---@field experts table Mode: Retrieve or assign. The expert info Lua table of this Proto.
--- Since: 1.11.3
local proto = Class()

---Creates a new Proto object.
---@param name string The name of the protocol.
---@param desc string A Long Text description of the protocol (usually lowercase).
---@return Proto The newly created Proto object.
local function ProtoNew(name, desc)
end

---@type Proto
Proto = { new = ProtoNew }

---Creates a Proto object.
---@param name string The name of the protocol.
---@param desc string A Long Text description of the protocol (usually lowercase).
---@return Proto The new Proto object.
function proto:__call(name, desc)
end

---Registers a heuristic dissector function for this Proto protocol, for the given heuristic list name.
---
---When later called, the passed-in function will be given:
---
---A Tvb object
---
---A Pinfo object
---
---A TreeItem object
---
---The function must return true if the payload is for it, else false.
---
---The function should perform as much verification as possible to ensure the payload is for it, and dissect the packet (including setting TreeItem info and such) only if the payload is for it, before returning true or false.
---
---Since version 1.99.1, this function also accepts a Dissector object as the second argument, to allow re-using the same Lua code as the function proto.dissector(…​). In this case, the Dissector must return a Lua number of the number of bytes consumed/parsed: if 0 is returned, it will be treated the same as a false return for the heuristic; if a positive or negative number is returned, then the it will be treated the same as a true return for the heuristic, meaning the packet is for this protocol and no other heuristic will be tried.
---
---Since: 1.11.3
---
---@param listname string The heuristic list name this function is a heuristic for (e.g., "udp" or "infiniband.payload").
---@param func function A Lua function that will be invoked for heuristic dissection.
function proto:register_heuristic(listname, func)
end

---@class ProtoExpert
---A Protocol expert info field, to be used when adding items to the dissection tree.
---
---Since: 1.11.3
local protoexpert = Class()

---Creates a new ProtoExpert object to be used for a protocol’s expert information notices.
---
---Since: 1.11.3
---@param abbr string Filter name of the expert info field (the string that is used in filters).
---@param text string The default text of the expert field.
---@param group any Expert group type: one of: expert.group.CHECKSUM, expert.group.SEQUENCE, expert.group.RESPONSE_CODE, expert.group.REQUEST_CODE, expert.group.UNDECODED, expert.group.REASSEMBLE, expert.group.MALFORMED, expert.group.DEBUG, expert.group.PROTOCOL, expert.group.SECURITY, expert.group.COMMENTS_GROUP or expert.group.DECRYPTION.
---@param severity any Expert severity type: one of: expert.severity.COMMENT, expert.severity.CHAT, expert.severity.NOTE, expert.severity.WARN, or expert.severity.ERROR.
---@return ProtoExpert The newly created ProtoExpert object.
local function ProtoExpertNew(abbr, text, group, severity)
end

ProtoExpert = {
    new = ProtoExpertNew,
}

---Returns a string with debugging information about a ProtoExpert object.
---
---Since: 1.11.3
function protoexpert:__tostring()
end

---@class ProtoField
---A Protocol field (to be used when adding items to the dissection tree).
local protofield = Class()

---Creates a new ProtoField object to be used for a protocol field.
---
---@param name string Actual name of the field (the string that appears in the tree).
---@param abbr string Filter name of the field (the string that is used in filters).
---@param type Ftype Field Type: one of: ftypes.BOOLEAN, ftypes.CHAR, ftypes.UINT8, ftypes.UINT16, ftypes.UINT24, ftypes.UINT32, ftypes.UINT64, ftypes.INT8, ftypes.INT16, ftypes.INT24, ftypes.INT32, ftypes.INT64, ftypes.FLOAT, ftypes.DOUBLE , ftypes.ABSOLUTE_TIME, ftypes.RELATIVE_TIME, ftypes.STRING, ftypes.STRINGZ, ftypes.UINT_STRING, ftypes.ETHER, ftypes.BYTES, ftypes.UINT_BYTES, ftypes.IPv4, ftypes.IPv6, ftypes.IPXNET, ftypes.FRAMENUM, ftypes.PCRE, ftypes.GUID, ftypes.OID, ftypes.PROTOCOL, ftypes.REL_OID, ftypes.SYSTEM_ID, ftypes.EUI64 or ftypes.NONE.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that corresponds to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing unit name for the values if base is base.UNIT_STRING, or one of frametype.NONE, frametype.REQUEST, frametype.RESPONSE, frametype.ACK or frametype.DUP_ACK if field type is ftypes.FRAMENUM.
---@param base Base optional. The representation, one of: base.NONE, base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC, base.UNIT_STRING or base.RANGE_STRING.
---@param mask number optional. The bitmask to be used.
---@param descr string optional. The description of the field.
---@return ProtoField The newly created ProtoField object.
local function ProtoFieldNew(name, abbr, type, valuestring, base, mask, descr)
end

---Creates a ProtoField of an 8-bit ASCII character.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.NONE, base.HEX, base.OCT or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldChar(abbr, name, base, valuestring, mask, desc)

end

---Creates a ProtoField of an unsigned 8-bit integer (i.e., a byte).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.HEX or base.OCT, base.DEC_HEX, base.HEX_DEC, base.UNIT_STRING or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing the unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldUint8(abbr, name, base, valuestring, mask, desc)

end

---Creates a ProtoField of an unsigned 16-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC, base.UNIT_STRING or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldUint16(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField of an unsigned 24-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC, base.UNIT_STRING, or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing the unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldUint24(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField of an unsigned 32-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC, base.UNIT_STRING, or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing the unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldUint32(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField of an unsigned 64-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.HEX, base.OCT, base.DEC_HEX, base.HEX_DEC, base.UNIT_STRING, or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing the unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldUint64(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField of a signed 8-bit integer (i.e., a byte).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.UNIT_STRING, or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldInt8(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField of a signed 16-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.UNIT_STRING, or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldInt16(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField of a signed 24-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.UNIT_STRING, or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldInt24(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField of a signed 32-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.UNIT_STRING, or base.RANGE_STRING.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldInt32(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField of a signed 64-bit integer.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.DEC, base.UNIT_STRING, or`base.RANGE_STRING`.
---@param valuestring table optional. A table containing the text that corresponds to the values, or a table containing tables of range string values that correspond to the values ({min, max, "string"}) if the base is base.RANGE_STRING, or a table containing unit name for the values if base is base.UNIT_STRING.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldInt64(abbr, name, base, valuestring, mask, desc)
end

---Creates a ProtoField for a frame number (for hyperlinks between frames).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. Only base.NONE is supported for framenum.
---@param frametype any optional. One of frametype.NONE, frametype.REQUEST, frametype.RESPONSE, frametype.ACK or frametype.DUP_ACK.
---@param mask number optional. Integer mask of this field, which must be 0 for framenum.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldFramenum(abbr, name, base, frametype, mask, desc)
end

---Creates a ProtoField for a boolean true/false value.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param display Base optional. How wide the parent bitfield is (base.NONE is used for NULL-value).
---@param valuestring table optional. A table containing the text that corresponds to the values.
---@param mask number optional. Integer mask of this field.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldBool(abbr, name, display, valuestring, mask, desc)
end

---Creates a ProtoField of a time_t structure value.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param base Base optional. One of base.LOCAL, base.UTC or base.DOY_UTC.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldAbsoluteTime(abbr, name, base, desc)
end

---Creates a ProtoField of a time_t structure value.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldRelativeTime(abbr, name, desc)
end

---Creates a ProtoField of a floating point number (4 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param valuestring table optional. A table containing unit name for the values.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldFloat(abbr, name, valuestring, desc)
end

---Creates a ProtoField of a double-precision floating point (8 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param valuestring table optional. A table containing unit name for the values.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldDouble(abbr, name, valuestring, desc)
end

---Creates a ProtoField of a string value.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param display Base optional. One of base.ASCII or base.UNICODE.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldString(abbr, name, display, desc)
end

---Creates a ProtoField of a zero-terminated string value.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param display Base optional. One of base.ASCII or base.UNICODE.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldStringz(abbr, name, display, desc)
end

---Creates a ProtoField for an arbitrary number of bytes.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param display Base optional. One of base.NONE, base.DOT, base.DASH, base.COLON or base.SPACE.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldBytes(abbr, name, display, desc)
end

---Creates a ProtoField for an arbitrary number of unsigned bytes.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param display Base optional. One of base.NONE, base.DOT, base.DASH, base.COLON or base.SPACE.
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldUbytes(abbr, name, display, desc)
end

---Creates a ProtoField of an unstructured type.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldNone(abbr, name, desc)
end

---Creates a ProtoField of an IPv4 address (4 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldIpv4(abbr, name, desc)
end

---Creates a ProtoField of an IPv6 address (16 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldIpv6(abbr, name, desc)
end

---Creates a ProtoField of an Ethernet address (6 bytes).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldEther(abbr, name, desc)
end

---Creates a ProtoField for a Globally Unique IDentifier (GUID).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldGuid(abbr, name, desc)
end

---Creates a ProtoField for an ASN.1 Organizational IDentified (OID).
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldOid(abbr, name, desc)
end

---Creates a ProtoField for a sub-protocol. Since 1.99.9.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldProtocol(abbr, name, desc)
end
---Creates a ProtoField for an ASN.1 Relative-OID.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldRelOid(abbr, name, desc)
end

---Creates a ProtoField for an OSI System ID.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldSystemid(abbr, name, desc)
end

---Creates a ProtoField for an EUI64.
---@param abbr string Abbreviated name of the field (the string used in filters).
---@param name string optional. Actual name of the field (the string that appears in the tree).
---@param desc string optional. Description of the field.
---@return ProtoField A ProtoField object to be added to a table set to the Proto.fields attribute.
local function ProtoFieldEui64(abbr, name, desc)
end

ProtoField = {
    new = ProtoFieldNew,
    char = ProtoFieldChar,
    uint8 = ProtoFieldUint8,
    uint16 = ProtoFieldUint16,
    uint24 = ProtoFieldUint24,
    uint32 = ProtoFieldUint32,
    uint64 = ProtoFieldUint64,
    int8 = ProtoFieldInt8,
    int16 = ProtoFieldInt16,
    int24 = ProtoFieldInt24,
    int32 = ProtoFieldInt32,
    int64 = ProtoFieldInt64,
    framenum = ProtoFieldFramenum,
    bool = ProtoFieldBool,
    absolute_time = ProtoFieldAbsoluteTime,
    relative_time = ProtoFieldRelativeTime,
    float = ProtoFieldFloat,
    double = ProtoFieldDouble,
    string = ProtoFieldString,
    stringz = ProtoFieldStringz,
    bytes = ProtoFieldBytes,
    ubytes = ProtoFieldUbytes,
    none = ProtoFieldNone,
    ipv4 = ProtoFieldIpv4,
    ipv6 = ProtoFieldIpv6,
    ether = ProtoFieldEther,
    guid = ProtoFieldGuid,
    oid = ProtoFieldOid,
    protocol = ProtoFieldProtocol,
    rel_oid = ProtoFieldRelOid,
    systemid = ProtoFieldSystemid,
    eui64 = ProtoFieldEui64,
}

---Returns a string with info about a protofield (for debugging purposes).
function protofield:__tostring()
end

--- Make a Proto protocol (with a dissector function) a post-dissector. It will be called for every frame after dissection.
---@param proto Proto The protocol to be used as post-dissector.
---@param allfields boolean optional. Whether to generate all fields. Note: This impacts performance (default=false).
function register_postdissector(proto, allfields)
end
---Make the TCP-layer invoke the given Lua dissection function for each PDU in the TCP segment, of the length returned by the given get_len_func function.
---
---This function is useful for protocols that run over TCP and that are either a fixed length always, or have a minimum size and have a length field encoded within that minimum portion that identifies their full length. For such protocols, their protocol dissector function can invoke this dissect_tcp_pdus() function to make it easier to handle dissecting their protocol’s messages (i.e., their protocol data unit (PDU)). This function shouild not be used for protocols whose PDU length cannot be determined from a fixed minimum portion, such as HTTP or Telnet.
---
---Since: 1.99.2
---@param tvb Tvb The Tvb buffer to dissect PDUs from.
---@param tree TreeItem The Tvb buffer to dissect PDUs from.
---@param min_header_size number The number of bytes in the fixed-length part of the PDU.
---@param get_len_func function A Lua function that will be called for each PDU, to determine the full length of the PDU. The called function will be given (1) the Tvb object of the whole Tvb (possibly reassembled), (2) the Pinfo object, and (3) an offset number of the index of the first byte of the PDU (i.e., its first header byte). The Lua function must return a Lua number of the full length of the PDU.
---@param dissect_func function A Lua function that will be called for each PDU, to dissect the PDU. The called function will be given (1) the Tvb object of the PDU’s Tvb (possibly reassembled), (2) the Pinfo object, and (3) the TreeItem object. The Lua function must return a Lua number of the number of bytes read/handled, which would typically be the Tvb:len().
---@param desegment boolean optional. Whether to reassemble PDUs crossing TCP segment boundaries or not. (default=true)
function dissect_tcp_pdus(tvb, tree, min_header_size, get_len_func, dissect_func, desegment)
end
