function onCreate()
    makeLuaSprite('BlackvignetteCycles','black_vignette',0,0)
    setObjectCamera('BlackvignetteCycles','hud')
    addLuaSprite('BlackvignetteCycles',true)

    makeLuaSprite('blackscreenCycles','',0,0)
    setObjectCamera('blackscreenCycles','hud')
    makeGraphic('blackscreenCycles',screenWidth,screenHeight,'000000')

    addLuaSprite('blackscreenCycles',false)

    makeLuaSprite('blackWhiteCycles','black_vignette',0,0)
    setObjectCamera('blackWhiteCycles','hud')
    makeGraphic('blackWhiteCycles',screenWidth,screenHeight,'FFFFFF')
    setProperty('blackWhiteCycles.alpha',0.001)
    addLuaSprite('blackWhiteCycles',false)
end
function onStepHit()
    if curStep == 128 then
        setProperty('blackscreenCycles.alpha',0.3)
    end
    if curStep == 1056 then
        setProperty('blackscreenCycles.alpha',1)
    end
    if curStep == 1072 then
        removeLuaSprite('blackscreenCycles',true)
        setProperty('blackWhiteCycles.alpha',1)
        doTweenAlpha('ByeWhiteCycles','blackWhiteCycles',0,0.5,'linear')
    end
end
function onTweenCompleted(tag)
    if tag == 'ByeWhiteCycles' then
        removeLuaSprite('blackWhiteCycles',true)
    end
end
