local foundedSong = false
function onCreate()
    if string.match(songName,'soulless') then 
        runTimer('waitASecondToLoadImages',0.2)
        makeLuaSprite('blackScreenWow','',0,0)
        setObjectCamera('blackScreenWow','other')
        makeGraphic('blackScreenWow',screenWidth,screenHeight,'000000')
        addLuaSprite('blackScreenWow',true)
        setProperty('camHUD.alpha',0)
        foundedSong = true
    end
end
function onUpdate()
    if foundedSong == true then
        for strumLineNotes = 0,3 do
            setPropertyFromGroup('strumLineNotes',strumLineNotes,'visible',false)
        end
        for notesLength = 0,getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes',notesLength,'mustPress') == false then
                setPropertyFromGroup('notes', notesLength,'visible',false)
            end
        end
    end
end
function onStepHit()
    if foundedSong == true then
        if curStep >= 3 then
            doTweenAlpha('byeBlackScreen','blackScreenWow',0,12,'linear')
        end
        if curStep == 64 then
            doTweenAlpha('helloHUD','camHUD',1,10,'linear')
        end
    end
end