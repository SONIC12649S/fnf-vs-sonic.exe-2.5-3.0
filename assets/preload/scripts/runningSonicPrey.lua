local jumpPlayed = false -- these variables were made for the song to play one time
local dashPlayed = false

local characters = {'dad','boyfriend','gf'}
local precachedSonic = false
function onCreatePost()
    if getProperty('boyfriend.curCharacter') == 'bf-running-sonic' then
        for eventNotes = 0,getProperty('eventNotes.length')-1 do
            if  getPropertyFromGroup('eventNotes',eventNotes,'event') == 'Play Animation' then
                if getPropertyFromGroup('eventNotes',eventNotes,'value1') == 'first dialogue' then
                    if string.lower(getPropertyFromGroup('eventNotes',eventNotes,'value2')) ~= 'bf' and string.lower(getPropertyFromGroup('eventNotes',eventNotes,'value2')) ~= 'gf' and string.lower(getPropertyFromGroup('eventNotes',eventNotes,'value2')) ~= 'dad' then
                        addCharacterToList('bf-Sonic-Peelout',characters[tonumber(getPropertyFromGroup('eventNotes',eventNotes,'value2'))])
                    end
                    if string.lower(getPropertyFromGroup('eventNotes',eventNotes,'value2') ~= 'bf') and getPropertyFromGroup('eventNotes',eventNotes,'value2') ~= '1' then
                        addCharacterToList('bf-Sonic-Peelout',getPropertyFromGroup('eventNotes',eventNotes,'value2'))
                    else
                        addCharacterToList('bf-Sonic-Peelout','boyfriend')
                    end
                end
            end
        end
    end
end
function onUpdate()
    if getProperty('boyfriend.curCharacter') == 'bf-running-sonic' then
        if getProperty('boyfriend.animation.curAnim.name') == 'first dialogue' then
            if getProperty('boyfriend.animation.curAnim.finished') == true then
                triggerEvent('Change Character','bf','bf-Sonic-Peelout')
            end
            if getProperty('boyfriend.animation.curAnim.curFrame') == 482 and jumpPlayed == false then
                playSound('SonicJump',2)
                jumpPlayed = true
            else
                jumpPlayed = false
            end
            if getProperty('boyfriend.animation.curAnim.curFrame') == 495 and dashPlayed == false then
                playSound('SonicDash',2)
                dashPlayed = true
            else
                dashPlayed = false
            end
        end
    end
end