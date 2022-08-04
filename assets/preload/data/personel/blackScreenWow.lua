function onCreate()
    makeLuaSprite('blackScreenPersonel','',0,0)
    setObjectCamera('blackScreenPersonel','hud')
    makeGraphic('blackScreenPersonel',screenWidth,screenHeight,'000000')
    addLuaSprite('blackScreenPersonel',false)
end
function onStepHit()
    if curStep == 32 then
        removeLuaSprite('blackScreenPersonel',true)
    end
end