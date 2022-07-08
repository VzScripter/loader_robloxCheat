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
