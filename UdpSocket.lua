---@meta

UdpSocket = {}

---The UDP Socket manages inbound and outbound data on a single assigned NIC and port.
---All incoming UDP data on the assigned NIC and port is passed to the event handler, regargless of origin.
---@return UdpSocket # New UDP Socket object.
function UdpSocket.New() end


---@class UdpSocket
---@field EventHandler fun(Socket: self, Data: UDPData, ...) Called whenever a packet is received.
---@field Data fun(Socket: self, Data: UDPData, ...) Alternate event handler only called when data is received. This is entirely redundant to the main event handler. 
---@field MulticastTtl number 0 - 255 (Default 1).<br>Can be set before or after socket is opened.
local UdpSocketObj = {}

---Open this UDP port.  
---Incoming data will be sent through the EventHandler.  
---Multicast traffic will be ignored unless self:JoinMulticast() is called.
---@param ip? IPAddress IP address on which to open the socket.<br>IP must match an existing NIC on the core.<br>If nil, IP will be assigned by the system.
---@param port? IPPort If nil, port will be assigned by the system.
function UdpSocketObj:Open(ip, port) end

---Close this UDP port.
function UdpSocketObj:Close() end

---Send data packet to destination device.
---@param ip IPAddress IP address of the destination device.
---@param port IPPort Port of the destination device.
---@param data string Data payload (up to 65535 bytes).
function UdpSocketObj:Send(ip, port, data) end

---Subscribe to milticast stream
---@param remoteIP IPAddress IP address of multicast stream.
---@param localIP? IPAddress IP address of the local NIC to bind to.<br>If nil, system will choose a nic at random.
function UdpSocketObj:JoinMulticast(remoteIP, localIP) end


---@class UDPData
---@field Address string Source IP Address of the packet.
---@field Port IPPort Source port of the packet.
---@field Data string Data payload.

---0 - 65535<br>
---32768 - 61000 - Ephemeral ports - safest for general use.
---
---Additional Information: [Q-SYS Help: Network Interfaces](https://q-syshelp.qsc.com/#Networking/Interfaces_Services.htm)
---@alias IPPort integer

---Additional Information: [Q-SYS Help: Addressing & Routing](https://q-syshelp.qsc.com/#Networking/Addressing_Routing.htm?TocPath=Plan%2520and%2520Learn%257CQ-SYS%2520Compatibility%257CQ-SYS%2520Networking%2520Requirements%257C_____4)
---@alias IPAddress string