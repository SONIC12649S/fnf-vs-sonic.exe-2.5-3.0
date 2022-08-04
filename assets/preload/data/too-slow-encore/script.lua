function onCreate()

    makeLuaSprite('blackscreenSlow','',0,0)
    setObjectCamera('blackscreenSlow','hud')
    makeGraphic('blackscreenSlow',screenWidth,screenHeight,'000000')
    setProperty('blackscreenSlow.alpha',0.001)
    addLuaSprite('blackscreenSlow',false)

    makeLuaSprite('RedScreenSlow','',0,0)
    setObjectCamera('RedScreenSlow','hud')
    makeGraphic('RedScreenSlow',screenWidth,screenHeight,'FF0000')
    setBlendMode('RedScreenSlow','add')
    setProperty('RedScreenSlow.alpha',0.001)
    addLuaSprite('RedScreenSlow',false)
end
function onStepHit()
    if curStep == 384 then
        setProperty('blackscreenSlow.alpha',1)
    end
    if curStep == 400 then
        setProperty('RedScreenSlow.alpha',1)
        doTweenAlpha('byeRedSlow','RedScreenSlow',0,0.5,'linear')
        doTweenAlpha('byeBlackSlow','blackscreenSlow',0,0.5,'linear')
    end
end
function onTweenCompleted(tag)
    if tag == 'byeRedSlow' then
        removeLuaSprite('RedScreenSlow',true)
    end
    if tag == 'byeBlackSlow' then
        removeLuaSprite('blackscreenSlow',true)
    end
end
