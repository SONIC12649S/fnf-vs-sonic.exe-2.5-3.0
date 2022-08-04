function onCreate()
    makeLuaSprite('blackScreenCycles','',0,0)
    setObjectCamera('blackScreenCycles','hud')
    makeGraphic('blackScreenCycles',screenWidth,screenHeight,'000000')
    addLuaSprite('blackScreenCycles',false)
    makeLuaSprite('whiteScreenCycles','',0,0)
    setObjectCamera('whiteScreenCycles','hud')
    makeGraphic('whiteScreenCycles',screenWidth,screenHeight,'FFFFFF')



    makeLuaSprite('blackVignette','black_vignette',0,0)
    setObjectCamera('blackVignette','other')
    addLuaSprite('blackVignette',true)
    setProperty('defaultCamZoom',0.8)
end
function onStepHit()
    if curStep == 128 then
        removeLuaSprite('blackScreenCycles',false)
    end
    if curStep == 1056 then
        addLuaSprite('blackScreenCycles',false)
    end
    if curStep == 1072 then
        addLuaSprite('whiteScreenCycles',false)
        doTweenAlpha('byeWhiteCycles','whiteScreenCycles',0,1,'linear')
        removeLuaSprite('blackScreenCycles',true)
    end
end
function onTweenCompleted(tag)
    if tag == 'byeWhiteCycles' then
        removeLuaSprite('byeWhiteCycles',true)
    end
end