---@meta

---Additional Information: [Q-SYS Help: UCI](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/Uci.htm?TocPath=Design%257CControl%2520Scripting%257CQ-SYS%2520Extensions%2520to%2520Lua%257C_____35)
Uci = {}


---@class DialogTable
---@field Title string
---@field Message string
---@field Buttons string[] Array of button labels. Buttons are defined based on this array.
---@field Handler fun(index) Function called upon a button press. Index is zero-based.


---@param UCIName UCIName
---@param dialogTable DialogTable
function Uci.ShowDialog(UCIName, dialogTable) end


---Assign a UCI to a touchpanel.
---The "UCI Assignment" property on the touchpanel must be set to "Dynamic".
---@param TSCName TSCName
---@param UCIName UCIName
function Uci.SetUCI(TSCName, UCIName) end


---Set the page to be displayed on a particular touchpanel or UCI viewer.
---This will not change pages on other touchpanels that are assigned to the same UCI.
---@param TSCName TSCName
---@param PageName string
function Uci.SetPage(TSCName, PageName) end


---Set whether and how a layer is made visible within a specified UCI name and page.
---This will be reflected on all touchpanels that that are assigned to that UCI.
---
---UCIName argument is dropped when scripting inside the UCI.
---@param UCIName UCIName
---@param PageName string
---@param LayerName string
---@param Visibility boolean
---@param TransitionType UCITransitionType
---@overload fun(PageName, LayerName, Visibility, TransitionType) 
function Uci.SetLayerVisibility(UCIName, PageName, LayerName, Visibility, TransitionType) end


---Set whether and how a shared layer is made visible within a specified UCI.
---This will be reflected on all touchpanels that that are assigned to that UCI.
---
---UCIName argument is dropped when scripting inside the UCI.
---@param UCIName UCIName
---@param LayerName string
---@param Visibility boolean
---@param TransitionType UCITransitionType
---@overload fun(LayerName, Visibility, TransitionType) 
function Uci.SetSharedLayerVisibility(UCIName, LayerName, Visibility, TransitionType) end


---Log off from a specified TSC touchscreen controller or UCI Viewer.
---PIN secuirity must be enabled in Core Manager
---@param TSCName TSCName
function Uci.LogOff(TSCName) end


---Get the value of a defined UCI variable.
---@param UCIName UCIName
---@param VarName string
---@return string|number|boolean
function Uci.GetVariable(UCIName, VarName) end

---Set the value of a defined UCI variable.
---@param UCIName UCIName
---@param VarName string
---@param VarValue string|number|boolean
function Uci.SetVariable(UCIName, VarName, VarValue) end

---Set the screen status of a TSC touchscreen controller or UCI Viewer.
---@param TSCName TSCName
---@param state TSCState
function Uci.SetScreen(TSCName, state) end


---Set the Channel Group to display on a TSC touchscreen controller or UCI Viewer.
---@param TSCName TSCName
---@param ChannelGroupID integer Channel group number.
function Uci.SetChannelGroup(TSCName, ChannelGroupID) end


---@alias TSCName string Hostname of the touchpanel device or UCI Viewer.

---@alias TSCState
---|"on"
---|"off"
---|"dim"

---@alias UCIName string Name of the UCI.

---@alias UCITransitionType
---|"none"
---|"fade"
---|"left"
---|"right"
---|"bottom"
---|"top"