---@meta

---@class Ssh:TCPSocketBase
---This allows for the use of the SSL protocol on top of the TcpSocket library.
---
---Additional Information: [Q-SYS Help: Ssh](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/Ssh.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____30)
Ssh = {}

---@return SshSocket
function Ssh.New() end

---@class SshSocket:TcpSocket
---@field LoginFailed fun(Socket:self, ...) Called when the login fails.
---@field IsInteractive boolean Enable interactive mode if the client device requires it.
---@field PublicKey string The public key in SSH-format when using PKI-based authentication.<br><br>Supported public key algorithms:<br>ssh-ed25519<br>ecdsa-sha2-nistp256<br>ecdsa-sha2-nistp384<br>ecdsa-sha2-nistp521<br>ssh-rsa<br>rsa-sha2-512<br>rsa-sha2-256<br>ssh-dss
---@field PrivateKey string The private key in OpenSSL PEM format when using PKI-based authentication.
---@field PrivateKeyPassword string The password used in conjunction with a private key (if the private key is password-protected) when using PKI-based authentication.
---@field Certificate string Used for PKI-based authentication.
---Additional Information: [PEM Format](https://en.wikipedia.org/wiki/Privacy-Enhanced_Mail)
local SshSocket = {}


---Attempts to connect to the specified ip/host name, port, and credentials.
---If PKI-based authentication is used, the credentials must first be set in h
---@param ip IPAddress IP address or hostname of the remote host.
---@param port IPPort Port to connect to on the remote host.
---@param user string Connection username.
---@param password string Connection password.
function SshSocket:Connect(ip, port, user, password) end