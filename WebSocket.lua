---@meta

WebSocket = {}

---@return WebSocket
function WebSocket.New() end


---@class WebSocket
---@field Connected fun(Socket: self, ...) Called upon connection to remote host.
---@field Data fun(Socket: self, Data: string, ...) Called when new data is recieved by the socket.
---@field Closed fun(Socket: self, ...) Called when the socket is closed.
---@field Error fun(Socket: self, Error: string, ...) Called when an error occurs on the socket.
local WebSocketObj = {}


---Connect to the remote device.
---@param protocol "ws" | "wss"
---@param host string IP address or URL hostname of the remote device.
---@param url string URL extension of the host parameter.
---@param port IPPort Port of the remote device.
---@param subProtocol? string
---@param headers? HTTPHeaders
function WebSocketObj:Connect(protocol, host, url, port, subProtocol, headers) end


---Write data to the socket.
---@param data string Binary or ASCII string. 
---@param isBinary? boolean True: binary, False: ASCII (default)
function WebSocketObj:Write(data, isBinary) end


---Close the connection.
function WebSocketObj:Close() end


---Ping the remote device to keep the connection alive.
function WebSocketObj:Ping() end