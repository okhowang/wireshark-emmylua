---@class Pinfo
---Packet information.
---@field visited boolean Mode: Retrieve only. Whether this packet has been already visited.
---@field number number Mode: Retrieve only. The number of this packet in the current file.
---@field len number Mode: Retrieve only. The length of the frame.
---@field caplen number Mode: Retrieve only. The captured length of the frame.
---@field abs_ts number Mode: Retrieve only. When the packet was captured.
---@field rel_ts number Mode: Retrieve only. Number of seconds passed since beginning of capture.
---@field delta_ts number Mode: Retrieve only. Number of seconds passed since the last captured packet.
---@field delta_dis_ts number Mode: Retrieve only. Number of seconds passed since the last displayed packet.
---@field curr_proto Proto Mode: Retrieve only. Number of seconds passed since beginning of capture.
---@field can_desegment boolean Mode: Retrieve or assign. Set if this segment could be desegmented.
---@field desegment_len number Mode: Retrieve or assign. Estimated number of additional bytes required for completing the PDU.
---@field desegment_offset number Mode: Retrieve or assign. Offset in the tvbuff at which the dissector will continue processing when next called.
---@field fragmented boolean Mode: Retrieve only. If the protocol is only a fragment.
---@field in_error_pkg boolean Mode: Retrieve only. If we’re inside an error packet.
---@field match_uint number Mode: Retrieve only. Matched uint for calling subdissector from table.
---@field match_string string Mode: Retrieve only. Matched string for calling subdissector from table.
---@field port_type any Mode: Retrieve or assign. Type of Port of .src_port and .dst_port.
---@field src_port any Mode: Retrieve or assign. Source Port of this Packet.
---@field dst_port any Mode: Retrieve or assign. Destination Port of this Packet.
---@field dl_src any Mode: Retrieve or assign. Data Link Source Address of this Packet.
---@field dl_dst any Mode: Retrieve or assign. Data Link Destination Address of this Packet.
---@field net_src any Mode: Retrieve or assign. Network Layer Source Address of this Packet.
---@field net_dst any Mode: Retrieve or assign. Network Layer Destination Address of this Packet.
---@field src any Mode: Retrieve or assign. Source Address of this Packet.
---@field dst any Mode: Retrieve or assign. Destination Address of this Packet.
---@field match any Mode: Retrieve only. Port/Data we are matching.
---@field columns any Mode: Retrieve only. Access to the packet list columns.
---@field cols any Mode: Retrieve only. Access to the packet list columns (equivalent to pinfo.columns).
---@field public private any Mode: Retrieve only. Access to the private table entries.
---@field hi any Mode: Retrieve only. Higher Address of this Packet.
---@field lo any Mode: Retrieve only. Lower Address of this Packet.
---@field conversation any Mode: Assign only. Sets the packet conversation to the given Proto object.
local pinfo = Class()
