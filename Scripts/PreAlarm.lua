local Config = require(script.Parent.Parent.Configuration.System)

local PreAlarmCount = 0

script.Parent.Event:Connect(function(data, data1, data2, data3, data4, data5, data6, data7, data8, data9)
	if data == "PreAlarm" then
		PreAlarmCount += 1
		
		if Config.PreAlarmOverride == true then
			if PreAlarmCount >= 2 then
				
				script.Parent:Fire("Evacuate", data1, data2, data3, data4, data5, data6, data7, data8, data9)
				
			end
		end
		
	elseif data == "Reset" then
		PreAlarmCount = 0
	end
end)
