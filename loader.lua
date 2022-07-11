local chosenGame = ({
    [606849621] = 'jailbreak.lua',
    [1224212277] = 'madcity.lua'
})[game.PlaceId]

if chosenGame then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/VzScripter/loader_robloxCheat/main/scripts/'..chosenGame))()
end
