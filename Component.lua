---@meta

---Additional Information: [Q-SYS Help: Component](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/Component.htm)
Component = {}

---Create a reference to another component in the design. This gives read and/or write access to the named component's controls.
---@param componentName CodeName Code name of the component.
---@return ComponentReference Component Table containing control references indexed by control name. An invalid code name will return an empty table.
function Component.New(componentName) end

---@return ComponentInfo[] Components Array with info on all script accessible components in the design. This table does not contain control information.
function Component.GetComponents() end

---@param componentName CodeName
---@return ControlInfo[] Controls Array of a component's controls and their current values. These are not control references and do not give read or write access to the controls. An invalid code name will return an empty table.
function Component.GetControls(componentName) end


---@class (exact) ControlInfo
---@field Value number
---@field String string
---@field Position number
---@field Boolean boolean
---@field Type string
---@field Index integer
---@field Direction string
---@field MinValue number
---@field MaxValue number
---@field MinString string
---@field MaxString string
---@field RampTime number

---@class ComponentReference
---@field [string] ControlReference Name of control.

---@class (exact) ComponentInfo
---@field Name string
---@field Type string
---@field Properties ComponentProperty[]

---@class (exact) ComponentProperty
---@field Name string
---@field PrettyName string
---@field Value	any


---Code name of a component that has been given script access.
---
---Additional Information: [Q-SYS Help: Code Name](https://q-syshelp.qsc.com/#Control_Scripting/Code_Name_Script_Access.htm?TocPath=Design%257CControl%2520Scripting%257C_____4)
---@alias CodeName string