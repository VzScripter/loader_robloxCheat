--[[ Menu Code ]]

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VzScripter/loader_robloxCheat/main/library/kavo_custom.lua'))()

local libraryVZ = Library.CreateLib('Madcity Menu (VzScripter)', 'VzScripterMain')

local menuM = libraryVZ:NewTab('UI')
local menu = menuM:NewSection('UI')
menu:NewKeybind('Abrir/Fechar UI', 'Para fechar e abrir a UI.', Enum.KeyCode.Insert, function()
    Library:ToggleUI()
end)

local luaMenusM = libraryVZ:NewTab('Lua Menus')
local luaMenus = luaMenusM:NewSection('Lua Menus')

local luaMenusTable = {}

for i, v in ipairs(luaMenusTable) do
    luaMenus:NewButton(v[1], 'Script externo "'..v[1]..'"', function()
        if not v[3] then
            loadstring(game:HttpGet(v[2]))()
            v[3] = true
        else
            GuiService:SetCore('SendNotification', {Title = 'Madcity Menu (VzScripter)', Text = 'O lua menu de "'..v[1]..'" já foi injetado.'})
        end
    end)
end

local farmM = libraryVZ:NewTab('Farm')
local farm = farmM:NewSection('Farm')

farm:NewButton('Dinheiro (Kick instantâneo)', 'Funcionando perfeitamente (10/07/2022)', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/shopv8.10115%20mc_bypass.lua', true))()
end)

farm:NewButton('XP (Reiniciar e quitar ao atingir o ranque desejado)', 'Funcionando perfeitamente (10/07/2022)', function()
    game:GetService('ReplicatedStorage').RemoteFunction:InvokeServer('SetTeam', 'Police')
    wait(.75)
    game:GetService('RunService').RenderStepped:Connect(function()
        for i, v in pairs(game:GetService('Players').LocalPlayer.Backpack:GetChildren()) do
            if v.Name == 'Handcuffs' then
                v.Parent = game:GetService('Players').LocalPlayer.Character
            end
        end
        game:GetService('ReplicatedStorage').Event:FireServer('Eject', game:GetService('Players').LocalPlayer)
    end)
end)

local sobre = libraryVZ:NewTab('Creditos')
local credito = sobre:NewSection('Livraria: Kavo (Custom) | Scripts: Vz Scripter')
local versao = sobre:NewSection('Versão 1.0')
local farm = sobre:NewSection('Aba Farm: www.poisonscripts.com')
