--[[
heyo hanera here
this only works with mpv so if you dont have that please install it!!!

to skip a song just press ctrl+c in your terminal, it will close the current mpv instance and immediately play the next song
also if you wanna loop the playlist add --loop or else just add anything else at the end if you leave it blank it will BREAK THE PATH


this was made in a few minutes and i dont plan on doing anything else with it because im stupid and scared ill break something

]]

local args = {...}
local isLooping = args[#args] -- last argument will ALWAYS be if the playlist is looping or not
-- note it has to be always included or else the path will break lmao
table.remove(args)
local playlistPath = table.concat(args, " ")
local playlistSongs = dofile(playlistPath)
-- loads the playlist file in the arguments




if isLooping == "--loop" then

    while true do
        for _,v in pairs(playlistSongs) do
            os.execute("mpv '" .. v .. "' --no-audio-display")
        end
    end 

else
        
    for _,v in pairs(playlistSongs) do
        os.execute("mpv '" .. v .. "' --no-audio-display")
    end

end