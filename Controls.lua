---@meta

---References the script's native controls.
---@type ComponentReference
Controls = {}


---@class (exact) ControlReference
---@field Value number
---@field Values number[]
---@field String string
---@field Strings string[]
---@field Position number Number between 0 and 1.
---@field Positions number[]
---@field Boolean boolean
---@field Legend string
---@field Choices string[]
---@field CssClass string Multiple class names can entered with spaces as shown:<br>"Class1 Class2 Class3"
---@field Color string Acceptable formats: <br> #RGB <br> #RRGGBB <br> !HHSSVV <br> CSS Color Names
---@field EventHandler fun(ctl: ControlReference)
---@field Trigger fun(ctl: ControlReference) Calls the event handler assigned to this control.
---@field IsDisabled boolean
---@field IsIndeterminate boolean
---@field IsInvisible boolean
---@field RampTime number

---@alias StatusCtlStates
---|0 OK
---|1 Compromised
---|2 Fault
---|3 Not Present
---|4 Missing
---|5 Initializing