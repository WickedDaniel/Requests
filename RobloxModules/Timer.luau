-- HOW TO USE
-- No documentation page LMAO
--[[
	1. Create your calls with the Method timerCall.new(time, runAtStart, function)
		1.1 - time: How many seconds till it runs again (30 = Every 30 Seconds, 60 = Every Minute)
		1.2 - runAtStart: Whether if it runs when the server starts
		1.3 - function: the functionr or "call" to run when the specified time is met 
	2. Call timerCall.Run() to start the timer (This can be done anywhere in the code)
]]

--[[
  Example Code:
  - Script Path: game.ServerScriptService.ServerHandler.ServerTimer

  -- Day and night script
  TimerCall.new(0.1, true, function()
	  game.Lighting.ClockTime += 0.1
  end)

  TimerCall.Run()
]]

--!strict
local timerCall = {}
timerCall.calls = {}

-------------------------------------------------------------
-- Clock Main

------------- Clock Settings
local ClockSettings = {}
-- How often the Timer checks if a call has to be made
ClockSettings.refreshRate = 0.05

function timerCall.getClockSetting(internalName: string)
	return ClockSettings[internalName]
end

------------- Clock Settings: END

local function fireTimeCheck(currentCall) : boolean
	local lastCalled = currentCall.lastCalled
	local fireTime = currentCall.fireTime
	if currentCall.fireAtStart then currentCall.fireAtStart = false return true end
	if (time() - lastCalled)  > fireTime then return true end
	return false
end

local function callUpdate(currentCall)
	currentCall.lastCalled = time()
	currentCall.call()
end

timerCall.stopClock = false
timerCall.Clock = coroutine.create(function()
	while task.wait(ClockSettings.refreshRate) do
		if timerCall.stopClock then coroutine.yield() end
		
		for _, currentCall in pairs(timerCall.calls) do
			if not fireTimeCheck(currentCall) then continue end
			callUpdate(currentCall)
		end
	end
end)

-- Clock Main: END
-------------------------------------------------------------
-- Clock Handler

function timerCall.Run()
  print("!!!--------> Clock Refresh Rate is set to " .. timerCall.getClockSetting("refreshRate"))
  print("!!!--------> Any Call set to wait less than that will be capped to the refresh rate"	  )
	timerCall.stopClock = false
	coroutine.resume(timerCall.Clock)
end

function timerCall.Stop()
  print("!!!--------> Clock Stopped!")
	timerCall.stopClock = true
end

-- Clock Handler: END
-------------------------------------------------------------
-- Call Handler

function timerCall.newTime(seconds: number, minutes: number, hours: number)
	return seconds + (minutes * 60) + (hours * 3600)
end

function timerCall.new(seconds: number, fireAtStart: boolean, funcCall: ()->())
	local newCall = {
		fireTime = seconds,
		fireAtStart = fireAtStart,
		lastCalled = time(),
		call = funcCall
	}
	table.insert(timerCall.calls, newCall)
	table.sort(timerCall.calls, function(a, b)
		return a.fireTime < b.fireTime
	end)
end

-- Call Handler: END
-------------------------------------------------------------

return timerCall
