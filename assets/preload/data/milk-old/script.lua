local camZoom = 0
local zoom = false
function onCreate()
    makeLuaSprite('spongBeautiful','SpingeBinge',getProperty('dad.x') + 200,getProperty('dad.y') + 250)
    
    scaleObject('spongBeautiful',1.2,1.2)
    addLuaSprite('spongBeautiful',true)
    setProperty('spongBeautiful.visible',false)
end
function onUpdate()
    if zoom == false then
        camZoom = getProperty('defaultCamZoom')
    end
    if curStep >= 69 and curStep < 96  then
        zoom = true
        setProperty('defaultCamZoom',getProperty('defaultCamZoom') + 0.005)
    end
    if curStep == 537 or curStep == 2273 then
        setProperty('dad.visible',false)
        setProperty('spongBeautiful.visible',true)
    end
    if curStep == 2281 or curStep == 2281 then
        setProperty('dad.visible',true)
        removeLuaSprite('spongBeautiful',true)
    end
    if curStep == 544 then
        setProperty('dad.visible',true)
        setProperty('spongBeautiful.visible',false)
    end
    if curStep >= 96 then
        setProperty('defaultCamZoom',camZoom)
        zoom = false
    end
end