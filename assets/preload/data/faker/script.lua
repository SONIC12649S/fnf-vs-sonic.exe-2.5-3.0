function onCreate()
    makeLuaSprite('blackScreenFaker','',0,0)
    setObjectCamera('blackScreenFaker','other')
    makeGraphic('blackScreenFaker',screenWidth,screenHeight,'000000')
end
function onStepHit()
    if curStep == 770 then
        doTweenAlpha('byeHud','camHUD',0,1,'linear')
    end
    if curStep == 883 then
        addLuaSprite('blackScreenFaker',false)
    end
end