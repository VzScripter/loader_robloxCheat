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
	{'CMD-X', 'https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source', false},
	{'Diamond Hub', 'https://raw.githubusercontent.com/BloxiYT/Diamond/main/JailBreak', false},
    {'Monkey Hub (Lag in inject)', 'https://raw.githubusercontent.com/KuriWasTaken/MonkeHub/main/Loader.lua', false},
}

for i, v in ipairs(luaMenusTable) do
    luaMenus:NewButton(v[1], 'Script externo "'..v[1]..'"', function()
        if not v[3] then
            loadstring(game:HttpGet(v[2]))()
            v[3] = true
        else
            GuiService:SetCore('SendNotification', {Title = 'Jailbreak Menu (VzScripter)', Text = 'O lua menu de "'..v[1]..'" já foi injetado.'})
        end
    end)
end

local principalM = libraryVZ:NewTab('Principal')
local principal = principalM:NewSection('Principal')

local cmdp = game:GetService("Players")
local cmdlp = cmdp.LocalPlayer

function CreateN(xPlayer, xHead)
	local ESP = Instance.new("BillboardGui", cmdlp.PlayerGui)
	local ESPSquare = Instance.new("Frame", ESP)
	local ESPText = Instance.new("TextLabel", ESP)
	ESP.Name = "ESPN"..xPlayer.Name
	ESP.Adornee = xHead
	ESP.AlwaysOnTop = true
	ESP.ExtentsOffset = Vector3.new(0, 1, 0)
	ESP.Size = UDim2.new(0, 5, 0, 5)
	ESPText.Name = "NAME"
	ESPText.BackgroundColor3 = Color3.new(255, 255, 255)
	ESPText.BackgroundTransparency = 1
	ESPText.BorderSizePixel = 0
	ESPText.Position = UDim2.new(0, 0, 0, -40)
	ESPText.Size = UDim2.new(1, 0, 10, 0)
	ESPText.Visible = true
	ESPText.ZIndex = 10
	ESPText.Font = Enum.Font.SourceSansSemibold
	ESPText.TextStrokeTransparency = 0.6
	ESPText.TextSize = 20
	ESPText.Text = xPlayer.Name
	ESPText.TextColor = xPlayer.TeamColor
end

function ClearN()
	for _,v in pairs(cmdlp.PlayerGui:GetChildren()) do
		if v.Name:sub(1,4) == "ESPN" and v:IsA("BillboardGui") then
			v:Destroy()
		end
	end
end

function FindN()
	ClearN()
	TrackN = true
	while wait() do
		if TrackN then
			ClearN()
			for i, v in pairs(cmdp:GetPlayers()) do
				if v ~= cmdlp and v.TeamColor ~= cmdlp.TeamColor then
					if v.Character and v.Character:FindFirstChild("Head") then
						CreateN(v, v.Character.Head, true)
					end
				end
			end
		end
		wait(1)
	end
end

local ESPNEnabled = false

principal:NewButton('Esp Name', 'Esp Name funcionando perfeitamente, unban.', function()
	if ESPNEnabled then
		ESPNEnabled = false
		wait(1)
		ClearN()
	else
		ESPNEnabled = true
		repeat
			while wait() do
				ClearN()
				if ESPNEnabled then
					for i,v in pairs(cmdp:GetPlayers()) do
						if v ~= cmdlp then
							if v.Character and v.Character:FindFirstChild("Head") then
								CreateN(v, v.Character.Head, true)
							end
						end
					end
				end
			end
		until not ESPNEnabled
	end
end)

principal:NewButton('Em breve..', 'Em Breve..', function()
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
