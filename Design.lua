---@meta

---Additional Information: [Q-SYS Help: Design](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/Design.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____6)
Design = {}

---@class DesignInfo
---@field DesignName string
---@field DesignCode string Unique code generated for the design.
---@field Platform "Emulator" | string Model of the core.
---@field IsRedundant boolean

---@return DesignInfo DesignInfo Table of information about the design that is running.
function Design.GetStatus() end


---@class DesignInventoryItem
---@field Type string Type of the device. This is a fixed value determined by Q-SYS.
---@field Name string Hostname of the device. Unrelated to design code name.
---@field Location string Location assigned in the device's properties.
---@field Model string Model number of the device.
---@field Status {Message:string, Code:StatusCtlStates}

---@return DesignInventoryItem[] DesignInventory Array of all inventory items defined in the design.
function Design.GetInventory() end
