---@meta

---@type SerialPort[]
---The SerialPorts object is an array of Serial Port objects.
---This array is automatically populated with any serial pins defined in GetPins().
---
---Additional Information:
---<br>[Q-SYS SDK: SerialPort Usage](https://q-syshelp.qsc.com/DeveloperHelp/#Code_Examples/SerialPort.htm?TocPath=Code%2520Examples%257C_____11)
---<br>[Q-SYS Help: SerialPorts](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/SerialPorts.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____25)
SerialPorts = {
	---@enum SerialPortEOL
	EOL = {
		Any = 0, 				--- Any number or combination of \r and \n
		CrLf = 1, 			--- \n or \r\n
		CrLfStrict = 2, --- \r\n only
		Lf = 3, 				--- \n only
		Null = 4, 			--- ASCII NUL
		Custom = 5, 		--- Custom string
	},
	---@enum SerialPortEvents
	Events = {
		Connected = "CONNECTED",
		Reconnect = "RECONNECT",
		Error = "ERROR",
		Data = "DATA",
		Closed = "EOF",
		Timeout = "TIMEOUT",
	},
}


---@class SerialPort
---Event Handlers
---@field EventHandler fun(SerialPort: self, Event: SerialPortEvents)
---@field Connected fun(SerialPort: self, ...) Called when the port is opened.
---@field Reconnect fun(SerialPort: self, ...) Called when the Core is attempting to reconnect to the port.
---@field Data fun(SerialPort: self, ...) Called when there is new data available in the port buffer.
---@field Closed fun(SerialPort: self, ...) Called when the port is closed.
---@field Error fun(SerialPort: self, Error: string, ...) Called when the port was closed due to an error.
---@field Timeout fun(SerialPort: self, Error: string, ...) Called when a read or write timeout is triggered and the port was closed.
---Properties
---@field IsOpen boolean Read-Only.
---@field BufferLength integer Read-Only. Number of bytes of data currently in the buffer.
local SerialPortObj = {}


---Attempts to open the serial port with the given parameters.
---@param baudRate SerialPortBaudRate
---@param dataBits? SerialPortDataBits Optional.
---@param parity? SerialPortParity Optional with dataBits.
function SerialPortObj:Open(baudRate, dataBits, parity) end


---Closes the port.
function SerialPortObj:Close() end


---Writes data to the port. Raises error if port is not open. (Check self.IsOpen)
---@param data string
function SerialPortObj:Write(data) end


---@param length integer Number of of bytes to read (and remove) from the buffer.
---@return string | nil # String containing the number of bytes requested or the number of bytes available, whichever comes first.
function SerialPortObj:Read(length) end


---@param EOL SerialPortEOL EOL type represented by an integer.
---@param custom? string EOL string when EOL param is set to "Custom".
---@return string | nil # String up to the first EOL sequence.
function SerialPortObj:ReadLine(EOL, custom) end


---@param string string String to find in the buffer.
---@param startPos? integer Optional starting search index.
---@return integer | nil # Starting index of the string.
function SerialPortObj:Search(string, startPos) end


---@alias SerialPortBaudRate
---|50
---|110
---|134
---|150
---|200
---|300
---|600
---|1200
---|1800
---|2400
---|4800
---|9600
---|19200
---|38400
---|75600
---|115200
---|230400


---@alias SerialPortDataBits
---|7
---|8 (default)


---@alias SerialPortParity
---|"N" None (default)
---|"E" Even
---|"O" Odd