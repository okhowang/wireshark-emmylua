---@class Address Represents an address.
local address = Class()

---Creates an Address Object representing an IPv4 address.
---@param hostname string The address or name of the IP host.
---@return Address The Address object.
local function AddressIp(hostname)
end

---Creates an Address Object representing an IPv6 address.
---@param hostname string The address or name of the IP host.
---@return Address The Address object
local function AddressIpv6(hostname)
end

---Creates an Address Object representing an Ethernet address.
---@param eth string The Ethernet address.
---@return Address The Address object.
local function AddressEther(eth)
end
Address = {
    ip = AddressIp,
    ipv6,
    ether,
}

---@return string The string representing the address.
function address:__tostring()
end

---@return boolean Compares two Addresses.
function address:__eq()
end

---@return boolean Compares two Addresses.
function address:__le()
end

---@return boolean Compares two Addresses.
function address:__lt()
end
