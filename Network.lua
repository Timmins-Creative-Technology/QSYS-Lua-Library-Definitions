---@meta

---Additional Information: [Q-SYS Help: Network](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/Network.htm)
Network = {}

---@param hostname string
---@return {name: string, addresses: IPAddress[]}
function Network.GetHostByName(hostname) end

---Get information on all of the NICs on the active core.
---@return CoreInterface[] # Array of core interfaces.
function Network.Interfaces() end

---@class CoreInterface
---@field Interface string Friendly name of interface (LAN A, LAN B, etc.)
---@field Address IPAddress
---@field MACAddress string
---@field BroadcastAddress IPAddress
---@field Gateway IPAddress
---@field Netmask IPAddress