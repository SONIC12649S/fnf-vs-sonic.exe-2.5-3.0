function onCreate()
    makeAnimatedLuaSprite('FlashingShitFatality','statix',0,0)
    addAnimationByPrefix('FlashingShitFatality','glitch','statixx',44,true)
    setProperty('FlashingShitFatality.alpha',0.9)
    scaleObject('FlashingShitFatality',3.2,2.45)
    setObjectCamera('FlashingShitFatality','hud')

    debugPrint(getProperty('dad.x'))
end

function onEvent(name,value1)
    if name == 'FatalityFlashin' then
        addLuaSprite('FlashingShitFatality',true)
        playSound('simplejumpsound')
        if value1 ~= '' and value1 ~= nil then
            runTimer('destroyFlashShitfatality',value1/5)
        else
            runTimer('destroyFlashShitfatality',0.2)
        end
    end
end
function onTimerCompleted(tag)
    if tag == 'destroyFlashShitfatality' then
        removeLuaSprite('FlashingShitFatality',false)
    end
end