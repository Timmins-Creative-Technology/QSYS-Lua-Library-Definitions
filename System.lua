---@meta

---@class (exact) System
---@field LockingID string Unique locking ID of the Q-SYS core for licensing purposes.
---@field IsEmulating boolean
---@field MajorVersion string Major version number of the Q-SYS environment.
---@field MinorVersion string Minor version number of the Q-SYS environment.
---@field BuildVersion string Build version number of the Q-SYS environment.
---@field Version string Full version number of the Q-SYS environment.
---Additional Information: [Q-SYS Help: System](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/System.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____31)
System = {}