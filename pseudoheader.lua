---Creates a "no" pseudoheader.
---@return PseudoHeader A null pseudoheader
local function PseudoHeaderNone()
end

---Creates an ethernet pseudoheader.
---@param fsclen number optional. The fcs length
---@return PseudoHeader The ethernet pseudoheader
local function PseudoHeaderEth(fsclen)
end

---Creates an ATM pseudoheader.
---@param aal number optional. AAL number
---@param vpi any optional. VPI
---@param vci any optional. VCI
---@param channel any optional. Channel
---@param cells number optional. Number of cells in the PDU
---@param aal5u2u any optional. AAL5 User to User indicator
---@param aal5len number optional. AAL5 Len
---@return PseudoHeader The ATM pseudoheader
local function PseudoHeaderAtm(aal, vpi, vci, channel, cells, aal5u2u, aal5len)
end

---Creates an MTP2 PseudoHeader.
---@param sent boolean optional. True if the packet is sent, False if received.
---@param annexa boolean optional. True if annex A is used.
---@param linknum number optional. Link Number.
---@return PseudoHeader The MTP2 pseudoheader
local function PseudoHeaderMtp2(sent, annexa, linknum)
end

PseudoHeader = {
    none = PseudoHeaderNone,
    eth = PseudoHeaderEth,
    atm = PseudoHeaderAtm,
    mtp2 = PseudoHeaderMtp2
}

---@class PseudoHeader
---A pseudoheader to be used to save captured frames.
local pseudoheader = Class()
