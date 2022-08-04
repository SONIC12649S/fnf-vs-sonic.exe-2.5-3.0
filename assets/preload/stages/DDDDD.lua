function onCreate()
    makeLuaSprite('TailsBG','TailsBG',-400,-250)
    scaleObject('TailsBG',1.4,1.4)
    addLuaSprite('TailsBG')
end
function onStepHit()
    if curStep == 588 then
        setProperty('TailsBG.visible',false)
        setProperty('boyfriend.visible',false)
    end
    if curStep == 860 then
        setProperty('TailsBG.visible',true)
        setProperty('boyfriend.visible',true)
    end
end