---@meta

---Additional Information: [Q-SYS Help: Timer](https://q-syshelp.qsc.com/#Control_Scripting/Using_Lua_in_Q-Sys/Timer.htm)
Timer = {}

---Note: Timers should be globally scoped. Locally scoped timers are likely to stop running.
---@return Timer # New timer object.
function Timer.New() end

---Calls a function once after a specified delay.
---@param func function
---@param delay number
function Timer.CallAfter(func, delay) end

---@return number # Number of seconds since epoch.
function Timer.Now() end


---@class Timer
---@field EventHandler fun(Timer: Timer, ...) Timer object is passed in as the first parameter.
local TimerObj = {}

---Starts timer. 
---Event handler will be called at the end of the defined interval.
---Timer will repeat until self:Stop() is called.
---@param interval number Period in seconds.
function TimerObj:Start(interval) end

--Stops timer.
function TimerObj:Stop() end

---@return boolean
function TimerObj:IsRunning() end