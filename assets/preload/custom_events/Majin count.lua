local camDefaultZoom = nil
local camZoomEnable = false
local hudAlphaChanged = false


function onCreate()
    makeLuaSprite('MajinCount1', 'three', 250, 50)
    setScrollFactor('MajinCount1', 0, 0)
    setObjectCamera('MajinCount1', 'other')

    makeLuaSprite('MajinCount2', 'two', 250, 50)
    setScrollFactor('MajinCount2', 0, 0)
    setObjectCamera('MajinCount2', 'other')


    makeLuaSprite('MajinCount3', 'one', 250, 50)
    setScrollFactor('MajinCount3', 0, 0)
    setObjectCamera('MajinCount3', 'other')

    makeLuaSprite('MajinCount4', 'gofun', 250, 50)
    setScrollFactor('MajinCount4', 0, 0)
    setObjectCamera('MajinCount4', 'other')
end
function onUpdate()
    if camZoomEnable == false then
        camDefaultZoom = getProperty('defaultCamZoom')
    end

    for Majin = 1,4 do
        setProperty('MajinCount'..Majin..'.y', getProperty('MajinCount'..Majin..'.y') + 5)
    end
end
function onEvent(name, value1, value2)
    if name == 'Majin count' then
        addLuaSprite('MajinCount'..value1, true)
        setProperty('MajinCount'..value1..'.alpha', 0.7)
        setProperty('MajinCount'..value1..'.y', 0)
        runTimer('MajinCount'..value1..' Bye', 0.001, 1)
        
        
        if tonumber(value1) < 4 then
            camZoomEnable = true
            setProperty('defaultCamZoom',getProperty('defaultCamZoom') + 0.1)
            if value2 == 'true' or value2 == '' then
                doTweenAlpha('wowInvisible','camHUD',0,0.5,'linear')
                hudAlphaChanged = true
            else
                if hudAlphaChanged == true then
                    doTweenAlpha('wowInvisible','camHUD',1,0.5,'linear')
                    hudAlphaChanged = false
                end
            end
        else
            doTweenAlpha('wowInvisible','camHUD',1,0.5,'linear')
            setProperty('defaultCamZoom',camDefaultZoom)
            camZoomEnable = false
        end
    end
end


function onTimerCompleted(tag)
    if tag == 'MajinCount3 Bye' then
        doTweenAlpha('MajinCount3 Tween', 'MajinCount3', 0, 0.3, 'linear')
    end
    if tag == 'MajinCount2 Bye' then
        doTweenAlpha('MajinCount2 Tween', 'MajinCount2', 0, 0.3, 'linear')
    end
    if tag == 'MajinCount1 Bye' then
        doTweenAlpha('1 Tween', 'MajinCount1', 0, 0.3, 'linear')
    end
    if tag == 'MajinCount4 Bye' then
        doTweenAlpha('MajinCount4 Tween', 'MajinCount4', 0, 0.3, 'linear')
    end
end

function onTweenCompleted(tag)
    for Majin = 1,4 do
        if tag == 'MajinCount'..Majin..' Bye' then
            removeLuaSprite('MajinCount'..Majin, false)
            scaleObject('MajinCount'..Majin,1,1)
        end
    end
end