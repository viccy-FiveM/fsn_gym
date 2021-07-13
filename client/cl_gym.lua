local PlayerData = {}
local training = false
local resting = false

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local blips = {
	{title="Gym", colour=7, id=311, x = -1201.2257, y = -1568.8670, z = 4.6101}
}

-- LOCATION (START)

local arms = {
    {x = -1202.9837,y = -1565.1718,z = 4.6115}
}

local pushup = {
    {x = -1203.3242,y = -1570.6184,z = 4.6115}
}

local yoga = {
    {x = -1204.7958,y = -1560.1906,z = 4.6115}
}

local situps = {
    {x = -1206.1055,y = -1565.1589,z = 4.6115}
}

local gym = {
    {x = -1195.6551,y = -1577.7689,z = 4.6115}
}

local chins = {
    {x = -1200.1284,y = -1570.9903,z = 4.6115}
}

-- LOCATION (END)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(situps) do
            DrawMarker(1, situps[k].x, situps[k].y, situps[k].z, 0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        end
	for k in pairs(chins) do
            DrawMarker(1, chins[k].x, chins[k].y, chins[k].z, 0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        end	
        for k in pairs(yoga) do
            DrawMarker(1, yoga[k].x, yoga[k].y, yoga[k].z, 0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        end
	for k in pairs(pushup) do
            DrawMarker(1, pushup[k].x, pushup[k].y, pushup[k].z, 0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        end
	for k in pairs(arms) do
            DrawMarker(1, arms[k].x, arms[k].y, arms[k].z, 0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        end
    end
end)

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		Util.CreateBlip(info.title, info.id, info.colour, {info.x, info.y, info.z}, true)
	end
	while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		for k in pairs(arms) do
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, arms[k].x, arms[k].y, arms[k].z)
			if dist <= 0.5 then
				hintToDisplay('Druk op ~INPUT_CONTEXT~ om je ~g~armen te trainen')
				if IsControlJustPressed(0, Util.GetKeyNumber('E') then
					if training == false then
						TriggerEvent('fsn_notify:displayNotification', 'Voorbereiding van de oefening', 'centerRight', 4000, 'success')
						Citizen.Wait(1000)					
						local playerPed = GetPlayerPed(-1)
						TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
						Citizen.Wait(30000)
						ClearPedTasksImmediately(playerPed)
						TriggerEvent('fsn_notify:displayNotification', 'Je moet 60 seconden rusten voordat je een andere oefening kan doen.', 'centerRight', 4000, 'error')
						training = true
					elseif training == true then
						TriggerEvent('fsn_notify:displayNotification', 'Je moet rusten...', 'centerRight', 4000, 'success')
						resting = true
						CheckTraining()
					end
				end			
			end
		end
		for k in pairs(chins) do
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chins[k].x, chins[k].y, chins[k].z)
			if dist <= 0.5 then
				hintToDisplay('Druk op ~INPUT_CONTEXT~ om ~g~pull-ups te doen')
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
						TriggerEvent('fsn_notify:displayNotification', 'Voorbereiding van de oefening', 'centerRight', 4000, 'success')
						Citizen.Wait(1000)					
						local playerPed = GetPlayerPed(-1)
						TaskStartScenarioInPlace(playerPed, "prop_human_muscle_chin_ups", 0, true)
						Citizen.Wait(30000)
						ClearPedTasksImmediately(playerPed)
						TriggerEvent('fsn_notify:displayNotification', 'Je moet 60 seconden rusten voordat je een andere oefening kan doen.', 'centerRight', 4000, 'error')
						training = true
					elseif training == true then
						TriggerEvent('fsn_notify:displayNotification', 'Je moet rusten...', 'centerRight', 4000, 'success')
						resting = true
						CheckTraining()
					end
				end			
			end
		end
		for k in pairs(pushup) do
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pushup[k].x, pushup[k].y, pushup[k].z)
			if dist <= 0.5 then
				hintToDisplay('Druk op ~INPUT_CONTEXT~ om ~g~pushups te doen')
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
						TriggerEvent('fsn_notify:displayNotification', 'Voorbereiding van de oefening', 'centerRight', 4000, 'success')
						Citizen.Wait(1000)								
						local playerPed = GetPlayerPed(-1)
						TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
						Citizen.Wait(30000)
						ClearPedTasksImmediately(playerPed)
						TriggerEvent('fsn_notify:displayNotification', 'Je moet 60 seconden rusten voordat je een andere oefening kan doen.', 'centerRight', 4000, 'error')
						training = true						
					elseif training == true then
						TriggerEvent('fsn_notify:displayNotification', 'Je moet rusten...', 'centerRight', 4000, 'success')
						resting = true
						CheckTraining()
					end
				end			
			end
		end
		for k in pairs(yoga) do
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, yoga[k].x, yoga[k].y, yoga[k].z)
			if dist <= 0.5 then
				hintToDisplay('Druk op ~INPUT_CONTEXT~ om ~g~yoga te doen')
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
						TriggerEvent('fsn_notify:displayNotification', 'Voorbereiding van de oefening', 'centerRight', 4000, 'success')
						Citizen.Wait(1000)					
						local playerPed = GetPlayerPed(-1)
						TaskStartScenarioInPlace(playerPed, "world_human_yoga", 0, true)
						Citizen.Wait(30000)
						ClearPedTasksImmediately(playerPed)
						TriggerEvent('fsn_notify:displayNotification', 'Je moet 60 seconden rusten voordat je een andere oefening kan doen.', 'centerRight', 4000, 'error')
					elseif training == true then
						TriggerEvent('fsn_notify:displayNotification', 'Je moet rusten...', 'centerRight', 4000, 'success')
						resting = true
						CheckTraining()
					end
				end			
			end
		end
		for k in pairs(situps) do
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, situps[k].x, situps[k].y, situps[k].z)
			if dist <= 0.5 then
				hintToDisplay('Druk op ~INPUT_CONTEXT~ om ~g~pushups te doen')
				if IsControlJustPressed(0, Keys['E']) then
					if training == false then
						TriggerEvent('fsn_notify:displayNotification', 'Voorbereiding van de oefening', 'centerRight', 4000, 'success')
						Citizen.Wait(1000)						
						local playerPed = GetPlayerPed(-1)
						TaskStartScenarioInPlace(playerPed, "world_human_sit_ups", 0, true)
						Citizen.Wait(30000)
						ClearPedTasksImmediately(playerPed)
						TriggerEvent('fsn_notify:displayNotification', 'Je moet 60 seconden rusten voordat je een andere oefening kan doen.', 'centerRight', 4000, 'error')

						training = true
					elseif training == true then
						TriggerEvent('fsn_notify:displayNotification', 'Je moet rusten...', 'centerRight', 4000, 'success')

						resting = true

						CheckTraining()
					end
				end			
			end
		end
	end
end)

function CheckTraining()
	if resting == true then
                TriggerEvent('fsn_notify:displayNotification', 'Je bent aan het rusten', 'centerRight', 4000, 'error')
		resting = false
		Citizen.Wait(60000)
		training = false
	end
	if resting == false then
                TriggerEvent('fsn_notify:displayNotification', 'Je kunt nu opnieuw trainen...', 'centerRight', 4000, 'success')
	end
end
