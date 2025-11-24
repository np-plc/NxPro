local Config = require(script.Parent.Parent.Configuration.System)
local API = script.Parent.Parent.NetAPI
local ZonesInTest = {}

script.Parent.Parent.NetAPI.Event:Connect(function(data, data1, data2, data3, data4, data5, data6, data7, data8)

	if data == "TestZone" then
		if not table.find(ZonesInTest, data1) then
			table.insert(ZonesInTest, data1)
		end

	elseif data == "RemoveTestZone" then
		local index = table.find(ZonesInTest, data1)
		if index then
			table.remove(ZonesInTest, index)
		end

	elseif data == "FinishedTest" then
		ZonesInTest = {}

	elseif data == "Evacuate" or data == "Trouble" or data == "Alarm" then
		for _, v in pairs(ZonesInTest) do
			if v == data3 then
				task.wait(Config.WalkTestTime + math.random(0.5, 2)) 
				API:Fire("Reset")
			end
		end
	end

end)
