local stopAnim = 0
function onUpdate()
    if stopAnim == 2 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength,'mustPress') == false then
                setPropertyFromGroup('notes', notesLength,'noAnimation',true)
            end
        end
    elseif stopAnim == 1 then
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', notesLength,'mustPress') == false then
                setPropertyFromGroup('notes', notesLength,'noAnimation',false)
            end
        end
        stopAnim = 0
    end
end
function opponentNoteHit()
    if curStep >= 2888 and curStep < 2895 or curStep >= 3016 and curStep < 3023 or curStep >= 4040 and curStep < 4047 then
        stopAnim = 2
        characterPlayAnim('dad','laugh',false)
        setProperty('dad.specialAnim',true)
    else
        if stopAnim == 2 then
            stopAnim = 1
        end
    end
end