local chosenGame = ({
    [606849621] = 'jailbreak.lua'
})[game.PlaceId]

if chosenGame then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/VzScripter/loader_robloxCheat/main/scripts/'..chosenGame))()
end
