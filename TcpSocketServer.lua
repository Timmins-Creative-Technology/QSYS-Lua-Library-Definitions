---@meta

---The TCP Socket Server listens for external TCP connection requests.
---
---Additional Information: [Q-SYS Help: TcpSocketServer](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/TcpSocketServer.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____33)
TcpSocketServer = {}

---@return TcpSocketServer
function TcpSocketServer.New() end


---@class TcpSocketServer
---@field EventHandler fun(NewSocket: TcpSocket, ...)
---This server will listen for TCP connection requests at a specified port using the self:Listen() method.
---A new TCPSocket object will be created for each connection and passed into the event handler.
---
---New TCPSocket objects will be garbage collected if they are not assigned to a table or variable. They can be differentiated using the .PeerAddress property on each socket.
---Sockets that are invalid or no longer in use should deleted to avoid memory leaks.
local TcpSocketServerObj = {}


---Begin listening for connection requests from clients on all NICs.
---@param port IPPort Port to open on the Core.
function TcpSocketServerObj:Listen(port) end


---Stop listening for connection requests.
function TcpSocketServerObj:Close() end