local SystemConfig = require(script.Parent.Parent.Configuration.System)
local WebhookConfig = SystemConfig.Webhooks
local API = script.Parent
local URL = WebhookConfig.URL
local http = game:GetService("HttpService")

local canSend = true

API.Event:Connect(function(data, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11)
	
	if WebhookConfig.Active == true and URL ~= nil then
	
	if data == "Evacuate" then
		if canSend == true then
		if WebhookConfig.LoggedEvents.Fire == true then
			
			local data = {
				['embeds'] = {{
					['title'] = "** FIRE STARTED IN ZONE ".. data3 .."**",
					['description'] = "A Fire has started in Zone " .. data3,
					['color'] = tonumber(0xA61414),
					['fields'] = {
						{ ['name'] = "Device Address", ['value'] = data7, ['inline'] = true },
						{ ['name'] = "Device ID", ['value'] = data2, ['inline'] = true },
						{ ['name'] = "Device Name", ['value'] = data1, ['inline'] = false },
						{ ['name'] = "Device Location", ['value'] = data5, ['inline'] = false },
						{ ['name'] = "Loop", ['value'] = data6, ['inline'] = true },
						{ ['name'] = "Activation Type", ['value'] = data4, ['inline'] = true },
						{ ['name'] = "Node", ['value'] = data8, ['inline'] = true },
						{ ['name'] = "Sector", ['value'] = data9, ['inline'] = true },
					},
					['footer'] = {
						['text'] = "NXPro5 | " .. os.date("%Y-%m-%d %H:%M:%S")
					}
				}}
			}
			local finaldata = http:JSONEncode(data)
			http:PostAsync(URL, finaldata)
			end
		end
		
	elseif data == "Disable" then
			if data1 == "FireRouting" then
				canSend = false
			end
		
		elseif data == "Enable" then
			if data1 == "FireRouting" then
				canSend = true
			end
		
		elseif data == "Trouble" then
			if canSend == true then
			if WebhookConfig.LoggedEvents.Trouble == true then

				local data = {
					['embeds'] = {{
						['title'] = "** TROUBLE STARTED IN ZONE ".. data3 .."**",
						['description'] = "A Trouble Condition has started in Zone " .. data3,
						['color'] = tonumber(0xC97B26),
						['fields'] = {
							{ ['name'] = "Device Address", ['value'] = data7, ['inline'] = true },
							{ ['name'] = "Device ID", ['value'] = data2, ['inline'] = true },
							{ ['name'] = "Device Name", ['value'] = data1, ['inline'] = false },
							{ ['name'] = "Device Location", ['value'] = data5, ['inline'] = false },
							{ ['name'] = "Loop", ['value'] = data6, ['inline'] = true },
							{ ['name'] = "Activation Type", ['value'] = data4, ['inline'] = true },
							{ ['name'] = "Node", ['value'] = data8, ['inline'] = true },
							{ ['name'] = "Sector", ['value'] = data9, ['inline'] = true },
						},
						['footer'] = {
							['text'] = "NXPro5 | " .. os.date("%Y-%m-%d %H:%M:%S")
						}
					}}
				}
				local finaldata = http:JSONEncode(data)
				http:PostAsync(URL, finaldata)

			end
			end
		elseif data == "ClassChange" then
			if canSend == true then
			if WebhookConfig.LoggedEvents.ClassChange == true then

				local data = {
					['embeds'] = {{
						['title'] = "** CLASSCHANGE STARTED IN ZONE ".. data3 .."**",
						['description'] = "A Class Change Condition has started in Zone " .. data3,
						['color'] = tonumber(0xC97B26),
						['fields'] = {
							{ ['name'] = "Device Address", ['value'] = data7, ['inline'] = true },
							{ ['name'] = "Device ID", ['value'] = data2, ['inline'] = true },
							{ ['name'] = "Device Name", ['value'] = data1, ['inline'] = false },
							{ ['name'] = "Device Location", ['value'] = data5, ['inline'] = false },
							{ ['name'] = "Loop", ['value'] = data6, ['inline'] = true },
							{ ['name'] = "Activation Type", ['value'] = data4, ['inline'] = true },
							{ ['name'] = "Node", ['value'] = data8, ['inline'] = true },
							{ ['name'] = "Sector", ['value'] = data9, ['inline'] = true },
						},
						['footer'] = {
							['text'] = "NXPro5 | " .. os.date("%Y-%m-%d %H:%M:%S")
						}
					}}
				}
				local finaldata = http:JSONEncode(data)
				http:PostAsync(URL, finaldata)

			end
			end
		elseif data == "Alarm" then
			if canSend == true then
			if WebhookConfig.LoggedEvents.Alarm == true then

				local data = {
					['embeds'] = {{
						['title'] = "** ALARM STARTED IN ZONE ".. data3 .."**",
						['description'] = "An Alarm Condition has started in Zone " .. data3,
						['color'] = tonumber(0xC97B26),
						['fields'] = {
							{ ['name'] = "Device Address", ['value'] = data7, ['inline'] = true },
							{ ['name'] = "Device ID", ['value'] = data2, ['inline'] = true },
							{ ['name'] = "Device Name", ['value'] = data1, ['inline'] = false },
							{ ['name'] = "Device Location", ['value'] = data5, ['inline'] = false },
							{ ['name'] = "Loop", ['value'] = data6, ['inline'] = true },
							{ ['name'] = "Activation Type", ['value'] = data4, ['inline'] = true },
							{ ['name'] = "Node", ['value'] = data8, ['inline'] = true },
							{ ['name'] = "Sector", ['value'] = data9, ['inline'] = true },
							{ ['name'] = "Alarm Type", ['value'] = data10, ['inline'] = true },
						},
						['footer'] = {
							['text'] = "NXPro5 | " .. os.date("%Y-%m-%d %H:%M:%S")
						}
					}}
				}
				local finaldata = http:JSONEncode(data)
				http:PostAsync(URL, finaldata)

			end
			end
		elseif data == "Silence" then
			if canSend == true then
			if WebhookConfig.LoggedEvents.Silence == true then

				local data = {
					['embeds'] = {{
						['title'] = "** ALARM SILENCED **",
						['description'] = "The alarm has been silenced.",
						['color'] = tonumber(0xD9D24E),
						['footer'] = {
							['text'] = "NXPro5 | " .. os.date("%Y-%m-%d %H:%M:%S")
						}
					}}
				}
				local finaldata = http:JSONEncode(data)
				http:PostAsync(URL, finaldata)

			end
			end
		elseif data == "Reset" then
			if canSend == true then
			if WebhookConfig.LoggedEvents.Reset == true then

				local data = {
					['embeds'] = {{
						['title'] = "** ALARM RESET **",
						['description'] = "The alarm has been reset.",
						['color'] = tonumber(0x72B52F),
						['footer'] = {
							['text'] = "NXPro5 | " .. os.date("%Y-%m-%d %H:%M:%S")
						}
					}}
				}
				local finaldata = http:JSONEncode(data)
				http:PostAsync(URL, finaldata)

			end
		end
	end
	
	end
	
end)
