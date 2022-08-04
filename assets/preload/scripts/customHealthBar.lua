
local healthBarWidth = 0
local healthBarHeight = 0
local healthBarX = 325
local healthBarY = 650

local HeatlhBarStyle = 0

local iconDadXOffset = 215
local iconBfXOffset = 215

local iconDadYOffset = 60
local iconBfYOffset = -20
function onCreatePost()
    if songName == 'Fight or Flight' then
        HeatlhBarStyle = 1
        healthBarWidth = getProperty('healthBar.width')
        healthBarHeight = getProperty('healthBar.height')
        healthBarX = screenWidth - 450
        healthBarY = screenHeight/2 + (getProperty('healthBar.height')/2)
        resetIcon(false,false,true)
    else
        if downscroll and HeatlhBarStyle ~= 0 then
            healthBarY = 90
        end
    end
end
function onUpdate()
    if HeatlhBarStyle ~= 0 then
        setProperty('healthBar.x',healthBarX)
        setProperty('healthBar.y',healthBarY)
        if HeatlhBarStyle == 1 then
            setProperty('healthBar.angle',90)
            setProperty('iconP1.visible',false)
            setProperty('iconP2.visible',false)
            setProperty('healthBar.width',20)
            setProperty('iconPlayer.x',healthBarX + (healthBarHeight/2) + iconBfXOffset)
            setProperty('iconOpponent.x',healthBarX + (healthBarHeight/2) + iconDadXOffset)
            if getProperty('health') < 0.30 then
                setProperty('iconPlayer.animation.curAnim.curFrame',1)
            else
                setProperty('iconPlayer.animation.curAnim.curFrame',0)
            end
            if getProperty('health') > 1.70 then
                setProperty('iconOpponent.animation.curAnim.curFrame',1)
            else
                setProperty('iconOpponent.animation.curAnim.curFrame',0)
            end
            if getProperty('health') < 2 then
                setProperty('iconPlayer.y',healthBarWidth/2 - getProperty('health') * 300 + 200 + 150 + iconBfYOffset)
                setProperty('iconOpponent.y',healthBarWidth/2 - getProperty('health') * 300 + 200 + iconDadYOffset)
            end
        end
    end
end
function resetIcon(player,opponent,both)
    if player == true or both == true then
        makeLuaSprite('iconPlayer','',healthBarX,healthBarY)
        setObjectCamera('iconPlayer','hud')
        loadGraphic('iconPlayer', 'icons/icon-'..getProperty('boyfriend.healthIcon'), 150)
        addAnimation('iconPlayer', getProperty('boyfriend.healthIcon'), {0,1}, 0, true)
        addLuaSprite('iconPlayer',true)
    end
    if opponent == true or both == true then
        makeLuaSprite('iconOpponent','',healthBarX,healthBarY)
        setObjectCamera('iconOpponent','hud')
        loadGraphic('iconOpponent', 'icons/icon-'..getProperty('dad.healthIcon'), 150)
        addAnimation('iconOpponent', getProperty('dad.healthIcon'), {0,1}, 0, true)
        addLuaSprite('iconOpponent',true)
    end
end