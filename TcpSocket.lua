---@meta

---@class TCPSocketBase
---The TCP Socket manages a single TCP connection with a remote host.
---The TCP Socket Server must be used to listen for incoming connection requests.
---Additional Information: [Q-SYS Help: TcpSocket](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/TcpSocket.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____32)
TcpSocket = {
	---@enum TCPEOL
	EOL = {
		Any = 0, 				--- Any number or combination of \r and \n
		CrLf = 1, 			--- \n or \r\n
		CrLfStrict = 2, --- \r\n only
		Lf = 3, 				--- \n only
		Null = 4, 			--- ASCII NUL
		Custom = 5, 		--- Custom string
	},
	---@enum TCPEvents
	Events = {
		Reconnect = "RECONNECT",
		Error = "ERROR",
		Data = "DATA",
		Closed = "EOF",
		Timeout = "TIMEOUT",
	},
}


---@return TcpSocket # TCP Socket Object 
function TcpSocket.New() end


---@class TcpSocket
---Event Handlers
---@field EventHandler fun(Socket: self, Event: TCPEvents, Error: string, ...) Called whenever there is activity on the socket.<br>Event parameter can be used to filter the response.<br>Alternatively, use the discrete callbacks for each event type.
---@field Connected fun(Socket: self, ...) Called upon connection to remote host.
---@field Reconnect fun(Socket: self, ...) Called when socket is attempting to reconnect to the remote host.
---@field Data fun(Socket: self, ...) Called when there is new data available in the socket buffer.
---@field Closed fun(Socket: self, ...) Called when the socket is closed by the remote host.
---@field Error fun(Socket: self, Error: string, ...) Called when the socket was closed due to an error.
---@field Timeout fun(Socket: self, Error: string, ...) Called when a read or write timeout is triggered and the socket was closed.
---Properties
---@field ReadTimeout number 	Time in seconds to wait for data to be available on socket before raising an Error.<br>Default: 0<br>Disable: 0
---@field WriteTimeout number Time in seconds to wait for data write to complete before raising an Error.<br>Default: 0<br>Disable: 0
---@field ReconnectTimeout number Time in seconds to wait before attempting to reconnect.<br>Default: 5<br>Disable: 0
---@field IsConnected boolean Read only.
---@field BufferLength integer Amount of data in buffer, in bytes. Read only.
---@field PeerAddress string Shows client IP if the core is acting as the server using TcpSocketServer. Otherwise an empty string or an error message.
local TcpSocketObj = {}

---Attempts to connect to the specified ip/host name and port.
---@param ip IPAddress IP address or hostname of the remote host.
---@param port IPPort Port to connect to on the remote host.
function TcpSocketObj:Connect(ip, port) end


---Disconnects the socket.
function TcpSocketObj:Disconnect() end


---Writes data to the socket. Raises error if port is not open. (Check self.IsConnected)
---@param data string
function TcpSocketObj:Write(data) end


---@param length integer Number of of bytes to read (and remove) from the buffer.
---@return string | nil # String containing the number of bytes requested or the number of bytes available, whichever comes first.
function TcpSocketObj:Read(length) end


---@param EOL TCPEOL EOL type represented by an integer.
---@param custom? string EOL string when EOL param is set to "Custom".
---@return string | nil # String up to the first EOL sequence.
function TcpSocketObj:ReadLine(EOL, custom) end


---@param string string String to find in the buffer.
---@param startPos? integer Optional starting search index.
---@return integer | nil # Starting index of the string.
function TcpSocketObj:Search(string, startPos) end