function onCreate()
    makeLuaSprite('blackScreenSunky','',0,0)
    setObjectCamera('blackScreenSunky','hud')
    makeGraphic('blackScreenSunky',screenWidth,screenHeight,'000000')
    makeLuaSprite('sunky0','sunky/sunkyMunch',-650,0)
    makeLuaSprite('sunky1','sunky/cereal',0,-720)
    makeLuaSprite('sunky2','sunky/cereal',-650,-720)
    makeLuaSprite('sunky3','sunky/sunkyPose',-680,0)

    makeLuaSprite('sunkyJumpscare','sunky/sunkage',0,0)
    setObjectCamera('sunkyJumpscare','hud')
    makeAnimatedLuaSprite('sunky4','sunky/sunker',320,100)
    addAnimationByPrefix('sunky4','idle','sunker',24,true)

    addLuaSprite('sunky0',true)
    addLuaSprite('sunky1',true)
    addLuaSprite('sunky2',true)
    addLuaSprite('sunky3',true)
    addLuaSprite('sunky4',true)
    setProperty('sunky4.alpha',0.001)
    addLuaSprite('blackScreenSunky',false)
    setProperty('blackScreenSunky.visible',false)
    addLuaSprite('sunkyJumpscare',false)
    setProperty('sunkyJumpscare.alpha',0.001)
    scaleObject('sunky4',4,4)
    for sunkys = 0,4 do
        setObjectCamera('sunky'..sunkys,'hud')
    end
end
function onUpdate()
    setProperty('sunky1.x',getPropertyFromGroup('strumLineNotes',4,'x'))
end
function onStepHit()
    if curStep == 131 then
        cameraShake('camGame',0.05,1)
        doTweenAlpha('wowSunky','sunky4',0.5,1,'linear')
    elseif curStep == 144 then
        removeLuaSprite('sunky4',true)
    elseif curStep == 550 then
        doTweenX('helloSunky0','sunky0',screenWidth,9.5,'linear')
    elseif curStep == 800 then
        doTweenY('helloSunky1','sunky1',screenHeight,7,'linear')
    elseif curStep == 928 then
        doTweenX('helloSunky2X','sunky2',screenWidth,8,'linear')
        doTweenY('helloSunky2Y','sunky2',screenHeight,8,'linear')
    elseif curStep == 1424 then
        setProperty('blackScreenSunky.visible',true)
    elseif curStep == 1440 then
        doTweenAlpha('sunkyJumpscareBoo','sunkyJumpscare',1,1.5,'linear')
    elseif curStep == 1456 then
        removeLuaSprite('sunkyJumpscare',true)
        removeLuaSprite('blackScreenSunky',true)
    end
end
function onTweenCompleted(tag)
    if string.match(tag,'helloSunky') == 'helloSunky' then
        for sunkys = 0,3 do
            if tag == 'helloSunky'..sunkys or tag == 'helloSunky'..sunkys..'X' or tag == 'helloSunky'..sunkys..'Y' then
                removeLuaSprite('sunky'..sunkys,true)
            end
        end
    end
end