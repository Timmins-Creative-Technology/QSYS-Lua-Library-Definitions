# QSYS-Lua-Library-Definitions

Last updated: August 2024

This repo contains a collection of library definition files for the Q-SYS Lua libraries.

The ultimate goal is to improve the Q-SYS plugin development experience in VS Code and reduce the need to check documentation.
In some areas, diagnostics, type checking, and annotations have been improved from the native language server in QSD's code editor.
Documentation links have also been provided where helpful.

This began as a way for me to take notes and snowballed into something that I have found super helpful.
If you find any errors or have suggestions, please feel free to comment or contribute.
I'll continue to add libraries (and improve existing ones) as time allows in the future.

## Testing Environment

- sumneko Lua Language Server 3.10.4
  - [sumneko Lua Language Server wiki](https://luals.github.io/wiki/annotations/)
- VS Code 1.92
- Q-SYS Designer 9.10
  - [Q-Sys Designer Help](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/Q-SYS_Extensions_to_Lua.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____0)
  - [Q-SYS SDK](https://q-syshelp.qsc.com/DeveloperHelp/#Standards_Definitions/Standards_Definitions.htm)

## To use in VSCode

1. Install the sumneko Lua Language Server extension.
2. Clone this repo to a local folder.
3. Add the folder's path under the "Lua.workspace.library" setting. (File > Preferences > Settings > Extensions > Lua > Workspace: Library)
4. Enjoy!

## Included Libraries

### August 2024 - Initial Commit

- Channel Group
- Component
- Controls
- Design
- Http Client
- Network
- Serial Ports
- Ssh
- System
- Tcp Socket
- Tcp Socket Server
- Uci
- UdpSocket
- WebSocket

## Future Libraries

- Crypto
- Dante API
- dir
- Email
- EzSVG
- JSON
- Log
- LPeg
- Lua Bitstring
- Lua Date
- Lua XML
- Mixer
- Named Control
- Notifications
- Ping
- QRCode
- RapidJSON
- Serial Server Ports
- Snapshot
- SNMP
- SNMP Trap
