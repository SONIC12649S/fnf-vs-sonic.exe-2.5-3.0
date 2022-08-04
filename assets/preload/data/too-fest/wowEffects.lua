function onCreate()
    makeAnimatedLuaSprite('explosionGood','Sanic/explosion',0,0)
    addAnimationByPrefix('explosionGood','idle','Explosion_',24,false)
    setBlendMode('explosionGood','add')
    setObjectCamera('explosionGood','hud')
    scaleObject('explosionGood',2,2)

    makeAnimatedLuaSprite('Guns','Sanic/Guns',0,0)
    addAnimationByPrefix('Guns','idle','Guns',34,false)
    setObjectCamera('Guns','hud')
    scaleObject('Guns',2,2)

    makeAnimatedLuaSprite('Glasses','Sanic/Glasses',0,0)
    addAnimationByPrefix('Glasses','idle','glasses',34,false)
    setObjectCamera('Glasses','hud')
    scaleObject('Glasses',2,2)

    makeAnimatedLuaSprite('Mlg','Sanic/Mlg',0,0)
    addAnimationByPrefix('Mlg','idle','mlg',34,false)
    setObjectCamera('Mlg','hud')
    scaleObject('Mlg',2,2)

    makeAnimatedLuaSprite('Hitmarkers','Sanic/hitmarkers',0,0)
    addAnimationByPrefix('Hitmarkers','idle','HitMarkers',24,false)
    setObjectCamera('Hitmarkers','hud')
    scaleObject('Hitmarkers',2,2)

    makeAnimatedLuaSprite('weebWow','Sanic/weeb',0,0)
    addAnimationByPrefix('weebWow','idle','weed-unscreen_',34,true)
    scaleObject('weebWow',2,2)
    setObjectCamera('weebWow','hud')

    makeAnimatedLuaSprite('NoScope','Sanic/NoScope',0,0)
    addAnimationByPrefix('NoScope','idle','NoScope',24,false)
    setObjectCamera('NoScope','hud')
    scaleObject('NoScope',2,2)

    precacheImage('Sanic/NoScope')
    precacheImage('Sanic/weeb')
    precacheImage('Sanic/Mlg')
    precacheImage('Sanic/Guns')
    precacheImage('Sanic/explosion')
    precacheImage('Sanic/hitmarkers')
    precacheImage('Sanic/Glasses')


end
function onUpdate()
    if getProperty('explosionGood.animation.curAnim.finished') == true then
        removeLuaSprite('explosionGood',false)
    end
    if getProperty('NoScope.animation.curAnim.finished') == true then
        removeLuaSprite('NoScope',false)
    end
    if getProperty('Hitmarkers.animation.curAnim.finished') == true then
        removeLuaSprite('Hitmarkers',false)
    end
    if getProperty('Guns.animation.curAnim.finished') == true then
        removeLuaSprite('Guns',false)
    end
    if getProperty('Mlg.animation.curAnim.finished') == true then
        removeLuaSprite('Mlg',false)
    end
    if getProperty('Glasses.animation.curAnim.finished') == true then
        removeLuaSprite('Glasses',false)
    end
end
function onStepHit()
    if curStep == 911 or curStep == 1040 then
        addLuaSprite('explosionGood',true)
        objectPlayAnimation('explosionGood','idle',true)
        setProperty('explosionGood.animation.curAnim.curFrame',3)
    elseif curStep == 912 then
        addLuaSprite('Mlg')
        addLuaSprite('Glasses',true)
    elseif curStep == 930 then
        addLuaSprite('weebWow',true)
        objectPlayAnimation('weebWow','idle',true)
    elseif curStep == 950 then
        addLuaSprite('Guns',true)
        objectPlayAnimation('Guns','idle',true)
    elseif curStep == 956 or curStep == 1168 then
        addLuaSprite('Hitmarkers',false)
        objectPlayAnimation('Hitmarkers','idle',true)
        playSound('Sanic/HitMarkers')
    elseif curStep == 1029 or curStep == 1156 then
        addLuaSprite('NoScope',true)
        objectPlayAnimation('NoScope','idle',true)
    elseif curStep == 1033 or curStep == 1036 or curStep == 1039 or curStep >= 1159 and curStep <= 1168 and curStep % 2 == 0 then
        
        setProperty('NoScope.animation.curAnim.curFrame',14)
        cameraShake('camGame',0.05,0.02)
        cameraShake('camHUD',0.03,0.02)
    elseif curStep == 1544 then
        addLuaSprite('Glasses',true)
        objectPlayAnimation('Glasses','idle',true)
    end
    if curStep == 1168 then
        removeLuaSprite('weebWow',true)
    end
end