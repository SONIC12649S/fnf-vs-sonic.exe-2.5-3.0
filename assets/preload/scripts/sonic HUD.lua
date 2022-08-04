local hudEnabled = false
local fontStyle = 'sonic1'
local enableCustomHud = false
local middleScrollEnabled = nil

local oldScreen = 0 -- 3 to do a tween effect, 2 to go to position, 1 to do a tween back and 0 to disable
local hudStyle = 0

local textX = 0
local textY = 0
local ofs = 50

local effectTime = 1

local borderCreated = false
local textInPosition = false

function onCreate()
    middleScrollEnabled = getPropertyFromClass('ClientPrefs','middleScroll')
    if songName == 'Fatality' then
        oldScreen = 2
        fontStyle = 'sonic3'
    elseif songName == 'milk' then
       oldScreen = 2
    end
    if not downscroll then 
        textY = screenHeight - 140
    else
        textY = ofs
    end
    makeLuaSprite('sonicMissesSprite','sonicUI/'..fontStyle..'/misses',textX,textY)
    setProperty('sonicMissesSprite.antialiasing',false)
    scaleObject('sonicMissesSprite',3.5,3.5)
    setObjectCamera('sonicMissesSprite','hud')

    makeLuaSprite('sonicTimeSprite','sonicUI/'..fontStyle..'/time',textX,textY + ofs)
    setProperty('sonicTimeSprite.antialiasing',false)
    scaleObject('sonicTimeSprite',3.5,3.5)
    setObjectCamera('sonicTimeSprite','hud')

    makeLuaSprite('sonicScoreSprite','sonicUI/'..fontStyle..'/score',textX,textY + (ofs * 2))
    setProperty('sonicScoreSprite.antialiasing',false)
    scaleObject('sonicScoreSprite',3.5,3.5)
    setObjectCamera('sonicScoreSprite','hud')


    makeLuaText('sonicScoreText',getProperty('score'),100,getProperty('sonicScoreSprite.x') + 200,getProperty('sonicScoreSprite.y') - 14)
    setObjectCamera('sonicScoreText','hud')
    scaleObject('sonicScoreText',3,3)
    setTextFont('sonicScoreText','sonic-1-hud-font.ttf')
    setTextBorder('sonicScoreText',1,'000000')
    setTextAlignment('sonicScoreText','left')

    makeLuaText('sonicMissesText',getProperty('songMisses'),100,getProperty('sonicMissesSprite.x') + getProperty('sonicMissesSprite.width'),getProperty('sonicMissesSprite.y') - 14)
    setObjectCamera('sonicMissesText','hud')
    scaleObject('sonicMissesText',3,3)
    setTextFont('sonicMissesText','sonic-1-hud-font.ttf')
    setTextBorder('sonicMissesText',1,'000000')
    setTextAlignment('sonicMissesText','left')

    makeLuaText('sonicTimeText',getSongPosition(),100,getProperty('sonicTimeSprite.x') + getProperty('sonicTimeSprite.width')/1.2,getProperty('sonicTimeSprite.y') - 14)
    setObjectCamera('sonicTimeText','hud')
    scaleObject('sonicTimeText',3,3)
    setTextFont('sonicTimeText','sonic-1-hud-font.ttf')
    setTextBorder('sonicTimeText',1,'000000')
    setTextAlignment('sonicTimeText','left')
end

function onUpdate()
    enableCustomHud = getPropertyFromClass('PlayState','isPixelStage')
    if hudStyle == 0 then
        if enableCustomHud == true and hudEnabled == false then
            if getPropertyFromClass('ClientPrefs','timeBarType') ~= 'Disabled' then
                setProperty('timeBarBG.visible',false)
                setProperty('timeBar.visible',false)
            end
            setProperty('scoreTxt.visible',false)
            setProperty('timeTxt.visible',false)
            setProperty('timeBar.visible',false)
            
            addLuaSprite('sonicScoreSprite',false)
            addLuaSprite('sonicTimeSprite',false)
            addLuaSprite('sonicMissesSprite',false)

            addLuaText('sonicScoreText',false)
            addLuaText('sonicMissesText',false)
            addLuaText('sonicTimeText',false)
            hudEnabled = true
        end
    end
    if enableCustomHud == false then
        if hudEnabled == true then
            setProperty('scoreTxt.visible',true)
            setProperty('timeTxt.visible',true)
            if getPropertyFromClass('ClientPrefs','timeBarType') ~= 'Disabled' then
                setProperty('timeBarBG.visible',true)
                setProperty('timeBar.visible',true)
            end

            removeLuaSprite('sonicScoreSprite',false)
            removeLuaSprite('sonicTimeSprite',false)
            removeLuaSprite('sonicMissesSprite',false)

            removeLuaText('sonicScoreText',false)
            removeLuaText('sonicMissesText',false)
            removeLuaText('sonicTimeText',false)
            setProperty('healthBar.x',320)
            hudEnabled = false
        end
    end
    if oldScreen == 3 then
        if borderCreated == false then
            makeLuaSprite('blackBorderSonic','',-160,0)
            setObjectCamera('blackBorderSonic','other')
            makeGraphic('blackBorderSonic',160,screenHeight,'000000')
            addLuaSprite('blackBorderSonic',true)
            doTweenX('helloBar1','blackBorderSonic',0,effectTime,'quartOut')

           
            makeLuaSprite('blackBorderSonic2','',screenWidth,0)
            setObjectCamera('blackBorderSonic2','other')
            makeGraphic('blackBorderSonic2',160,screenHeight,'000000')
            addLuaSprite('blackBorderSonic2',true)
            doTweenX('helloBar2','blackBorderSonic2',screenWidth - 155,effectTime,'quartOut')
            
            for strumLineNotes = 0,7 do
                if strumLineNotes < 4 then
                    if not middleScrollEnabled then
                        noteTweenX('notesTweenX'..strumLineNotes,strumLineNotes,180 + (112 * strumLineNotes),effectTime,'quartOut')
                    else
                        if strumLineNotes < 2 then
                            noteTweenX('notesTweenX'..strumLineNotes,strumLineNotes,170 + (112 * strumLineNotes),effectTime,'quartOut')
                        else
                            noteTweenX('notesTweenX'..strumLineNotes,strumLineNotes,screenWidth - 620 + (112 * strumLineNotes),effectTime,'quartOut')
                        end
                    end
                else
                    if not middleScrollEnabled then
                        noteTweenX('notesTweenX'..strumLineNotes,strumLineNotes,screenWidth - 620 + (112 * (strumLineNotes - 4)),effectTime,'quartOut')
                    end
                end
            end
            borderCreated = true
            if hudEnabled == true and textInPosition == false then
                textX = 160
                doTweenX('goScoreTxt','sonicScoreSprite',textX,effectTime,'quartOut')
                doTweenX('goMissesTxt','sonicMissesSprite',textX,effectTime,'quartOut')
                doTweenX('goTimeTxt','sonicTimeSprite',textX,effectTime,'quartOut')
                textInPosition = true
            end
            runTimer('okChange',effectTime)
        end
    end
    if oldScreen == 2 then
        textX = 160
        makeLuaSprite('blackBorderSonic','',0,0)
        setObjectCamera('blackBorderSonic','other')
        makeGraphic('blackBorderSonic',160,screenHeight,'000000')
        
        makeLuaSprite('blackBorderSonic2','',screenWidth - 155,0)
        setObjectCamera('blackBorderSonic2','other')
        makeGraphic('blackBorderSonic2',160,screenHeight,'000000')
        addLuaSprite('blackBorderSonic',true)
        addLuaSprite('blackBorderSonic2',true)
        if hudEnabled == true and textInPosition == false then
            textX = 160
            setProperty('sonicScoreSprite.x',textX)
            setProperty('sonicMissesSprite.x',textX)
            setProperty('sonicTimeSprite.x',textX)
            textInPosition = true
        end
        for strumLineNotes = 0,7 do
            if strumLineNotes < 4 then
                if middleScrollEnabled == false then
                    setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',180 + (112 * strumLineNotes))
                else
                    if strumLineNotes < 2 then
                        setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',170 + (112 * strumLineNotes))
                    else
                        setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',screenWidth - 620 + (112 * strumLineNotes))
                    end
                end
            else
                if middleScrollEnabled == false then
                    setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',screenWidth - 620 + (112 * (strumLineNotes - 4)))
                end
            end
        end
    end
    if oldScreen == 1 then
        textX = 0
        doTweenX('byeBorder','blackBorderSonic',getProperty('blackBorderSonic.width') *-1,1,'quartInOut')


        for strumLineNotes = 0,7 do
            if strumLineNotes < 4 then
                if middleScrollEnabled == false then
                    setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',92 + (112 * strumLineNotes))
                else
                    if strumLineNotes < 2 then
                        setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',92 + (112 * strumLineNotes))
                    else
                        setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',screenWidth - 460 + (112 * strumLineNotes))
                    end
                end
            else
                if middleScrollEnabled == false then
                    setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',screenWidth - 548 + (112 * (strumLineNotes - 4)))
                end
            end
        end
        oldScreen = 0
    end
    if hudEnabled == true then
        setProperty('healthBar.x',500)
        setProperty('sonicTimeText.x',getProperty('sonicTimeSprite.x') + getProperty('sonicTimeSprite.width')/1.2)
        setProperty('sonicTimeText.y',getProperty('sonicTimeSprite.y') - 14)
        setTextString('sonicTimeText',math.floor(getSongPosition()/60000)..':'..math.floor((getSongPosition()/10000) % 6).. math.floor(getSongPosition()/1000) % 10)
    
        setProperty('sonicMissesText.x',getProperty('sonicMissesSprite.x') + getProperty('sonicMissesSprite.width') + 10)
        setProperty('sonicMissesText.y',getProperty('sonicMissesSprite.y') - 14)
        setTextString('sonicMissesText',getProperty('songMisses'))
    
        setProperty('sonicScoreText.x',getProperty('sonicScoreSprite.x') + getProperty('sonicScoreSprite.width') + 10)
        setProperty('sonicScoreText.y',getProperty('sonicScoreSprite.y') - 14)
        setTextString('sonicScoreText',getProperty('songScore'))
    end
end
function onTweenCompleted(tag)
    if tag == 'byeBorder' then
        removeLuaSprite('blackBorderSonic',false)
        bordersCreated = false
    end
    if tag == 'byeBorder2' then
        removeLuaSprite('blackBorderSonic2',false)
        bordersCreated = false
    end
end
function onTimerCompleted(tag)
    if tag == 'okChange' and oldScreen == 3 then
        oldScreen = 2
    end 
end