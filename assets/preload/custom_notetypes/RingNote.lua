local ringCounter = 0

function onCreate()
    makeLuaSprite('RingCounterImage','Counter',1100,600)
    setObjectCamera('RingCounterImage','hud')
    addLuaSprite('RingCounterImage',true)

    makeLuaText('RingCounterText',ringCounter,100,getProperty('RingCounterImage.x') + 230,getProperty('RingCounterImage.y') + 15)
    setObjectCamera('RingCounterText','hud')
    setProperty('RingCounterText.scale.x',4)
    setProperty('RingCounterText.scale.y',4)
    setProperty('RingCounterText.antialiasing',false)
    setTextAlignment('RingCounterText','left')
    setTextColor('RingCounterText','FFCC33')
    setTextBorder('RingCounterText',1,'CC6700')
    addLuaText('RingCounterText')
    

    for i = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i,'noteType') == 'RingNote' then
            
            setPropertyFromGroup('unspawnNotes', i,'texture','RingNote')
            setPropertyFromGroup('unspawnNotes', i,'noAnimation',true)
            setPropertyFromGroup('unspawnNotes', i,'ignoreNote',true)
        end
    end
end
function goodNoteHit(id,data,type,sus)
    if type == 'RingNote' then
        playSound('Ring')
        ringCounter = ringCounter + 1
        setTextString('RingCounterText',ringCounter)
    end
end

function noteMiss(id,data,noteType,sus)
    if getPropertyFromGroup('notes',id,'ignoreNote') == false  and ringCounter > 0 then
        ringCounter = ringCounter - 1
        setProperty('songMisses',getProperty('songMisses') - 1)
        setTextString('RingCounterText',ringCounter)
        RecalculateRating()
    end
end