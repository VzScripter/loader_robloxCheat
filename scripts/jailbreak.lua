--[[ Menu Code ]]

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VzScripter/loader_robloxCheat/main/library/kavo_custom.lua'))()

local libraryVZ = Library.CreateLib('Jailbreak Menu (VzScripter)', 'VzScripterMain')

local menuM = libraryVZ:NewTab('UI')
local menu = menuM:NewSection('UI')
menu:NewKeybind('Abrir/Fechar UI', 'Para fechar e abrir a UI.', Enum.KeyCode.Insert, function()
    Library:ToggleUI()
end)

local luaMenusM = libraryVZ:NewTab('Lua Menus')
local luaMenus = luaMenusM:NewSection('Lua Menus')

local luaMenusTable = {
    ['Monkey Hub (Lag in inject)'] = {'https://raw.githubusercontent.com/KuriWasTaken/MonkeHub/main/Loader.lua', false},
    ['Diamond Hub'] = {'https://raw.githubusercontent.com/BloxiYT/Diamond/main/JailBreak', false},
}

for i, v in pairs(luaMenusTable) do
    luaMenus:NewButton(i, 'Script externo "'..i..'"', function()
        if not v[2] then
            loadstring(game:HttpGet(v[1]))()
            v[2] = true
        else
            GuiService:SetCore('SendNotification', {Title = 'Jailbreak Menu (VzScripter)', Text = 'O lua menu de "'..i..'" já foi injetado.'})
        end
    end)
end

local principalM = libraryVZ:NewTab('Principal')
local principal = principalM:NewSection('Principal')

function sFLY(vfly)
	FLYING = false
	speedofthefly = 1
	speedofthevfly = 1
	while not cmdlp or not cmdlp.Character or not cmdlp.Character:FindFirstChild('HumanoidRootPart') or not cmdlp.Character:FindFirstChild('Humanoid') or not cmdm do
		 wait()
	end 
	local T = cmdlp.Character.HumanoidRootPart
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0
	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro', T)
		local BV = Instance.new('BodyVelocity', T)
		BG.P = 9e4
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			while FLYING do
				if not vfly then
					cmdlp.Character:FindFirstChild("Humanoid").PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
				wait()
			end
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:destroy()
			BV:destroy()
			cmdlp.Character.Humanoid.PlatformStand = false
		end)
	end
	cmdm.KeyDown:connect(function(KEY)
		if KEY:lower() == 'w' then
			if vfly then
				CONTROL.F = speedofthevfly
			else
				CONTROL.F = speedofthefly
			end
		elseif KEY:lower() == 's' then
			if vfly then
				CONTROL.B = - speedofthevfly
			else
				CONTROL.B = - speedofthefly
			end
		elseif KEY:lower() == 'a' then
			if vfly then
				CONTROL.L = - speedofthevfly
			else
				CONTROL.L = - speedofthefly
			end
		elseif KEY:lower() == 'd' then
			if vfly then
				CONTROL.R = speedofthevfly
			else
				CONTROL.R = speedofthefly
			end
		elseif KEY:lower() == 'y' then
			if vfly then
				CONTROL.Q = speedofthevfly*2
			else
				CONTROL.Q = speedofthefly*2
			end
		elseif KEY:lower() == 't' then
			if vfly then
				CONTROL.E = -speedofthevfly*2
			else
				CONTROL.E = -speedofthefly*2
			end
		end
	end)
	cmdm.KeyUp:connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'y' then
			CONTROL.Q = 0
		elseif KEY:lower() == 't' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

principal:NewButton('Fly', 'Fly funcionando perfeitamente, unban.', function()
     sFLY(not FLYING)
end)

local veiculosM = libraryVZ:NewTab('Veiculos')
local veiculos = veiculosM:NewSection('Veiculos')

local nitroActivated = false

veiculos:NewButton('Nitro Infinito (Apenas Ativa)', 'Nitro infinito e jetpack infinito', function()
    if not nitroActivated then
        for i, v in pairs(getgc(true)) do
            if typeof(v) == 'table' then
                for _, b in pairs(v) do
                    if tostring(_) == 'Nitro' then
                        while true do
                            v[tostring(_)] = 90
                            wait()
                        end
                    end
                end
            end
        end
        nitroActivated = true
    end
end)

local armasM = libraryVZ:NewTab('Armas')
local armas = armasM:NewSection('Armas')

armas:NewButton('Tiro rápido (Todas armas)', 'Rapid Fire Simples', function()
    for i, v in pairs(game:GetService('ReplicatedStorage').Game.ItemConfig:GetChildren()) do
        local a = require(v)
        
        a.MagSize = 100
        a.CamShakeMagnitude = 0
        a.FireAuto = true
        a.FireFreq = 100
    end
end)

local sobre = libraryVZ:NewTab('Creditos')
local credito = sobre:NewSection('Livraria: Kavo (Custom) | Scripts: Vz Scripter')
local versao = sobre:NewSection('Versão 1.0')
