local cutsceneStage = 0
local curZoom = 0
local dadX = 0
local dadY = 0
function onCreate()
    makeLuaSprite('ChamberSky','Chamber/Wall',-600,-200)
    addAnimationByPrefix('ChamberSky','normal','Wall instance',0,true)
    addAnimationByPrefix('ChamberSky','broked','Wall Broken instance',0,true)
    addLuaSprite('ChamberSky')

    makeAnimatedLuaSprite('ChamberFloor','Chamber/Floor',-3000,1000)
    addAnimationByPrefix('ChamberFloor','yellow','floor yellow',0,true)
    addAnimationByPrefix('ChamberFloor','blue','floor blue',0,true)
    scaleObject('ChamberFloor',1.2,1.2)
    addLuaSprite('ChamberFloor')

    makeAnimatedLuaSprite('ChamberRock','Chamber/FleetwayBGshit',-2600,-1300)
    addAnimationByPrefix('ChamberRock','yellow','BGyellow',24,true)
    addAnimationByPrefix('ChamberRock','normal','BGblue',24,true)
    addLuaSprite('ChamberRock')
    if not lowQuality then
        makeAnimatedLuaSprite('ChamberPebles','Chamber/pebles',750,1250)
        addAnimationByPrefix('ChamberPebles','normal','pebles instance 1',24,true)
        addAnimationByPrefix('ChamberPebles','yellow','pebles instance 2',24,true)
        addLuaSprite('ChamberPebles')
    end

    makeAnimatedLuaSprite('ChamberRainEmerald','Chamber/Emerald Beam',0,-400)
    addAnimationByPrefix('ChamberRainEmerald','rain','Emerald Beam instance 1',24,true)
    addLuaSprite('ChamberRainEmerald') 
    scaleObject('ChamberRainEmerald',1,0.6)

    makeAnimatedLuaSprite('ChamberRainEmerald2','Chamber/Emerald Beam Charged',-200,-400)
    addAnimationByPrefix('ChamberRainEmerald2','rain','Emerald Beam Charged instance 1',24,true)
    addLuaSprite('ChamberRainEmerald2')
    setProperty('ChamberRainEmerald2.alpha',0.1)
    scaleObject('ChamberRainEmerald2',1,0.6)

    makeAnimatedLuaSprite('ChamberMasterEmerald','Chamber/Emeralds',400,-200)
    addAnimationByPrefix('ChamberMasterEmerald','fly','TheEmeralds instance',24,true)
    addLuaSprite('ChamberMasterEmerald')



    makeAnimatedLuaSprite('Chamber','Chamber/The Chamber',-200,550)
    addAnimationByPrefix('Chamber','wowSonic','Chamber Sonic Fall',24,false)
    addLuaSprite('Chamber')
    if songName == 'chaos' then
        makeLuaSprite('wowYellowChamber','',0,0)
        setObjectCamera('wowYellowChamber','other')
        makeGraphic('wowYellowChamber',screenWidth,screenHeight,'FFFF96')
        setBlendMode('wowYellowChamber','add')

        makeLuaSprite('wowRedChamber','',0,0)
        setObjectCamera('wowRedChamber','other')
        makeGraphic('wowRedChamber',screenWidth,screenHeight,'FF0000')
        setBlendMode('wowowRedChamberwRed','add')
    end

end
function onCreatePost()
    if songName == 'chaos' then
        cutsceneStage = 1
        setObjectOrder('Chamber',20)
        runTimer('wowJumpscareSonic',1)
        setProperty('camHUD.alpha',0)
        objectPlayAnimation('ChamberRock','blue',true)
        objectPlayAnimation('ChamberFloor','blue',true)
        dadX = getProperty('dad.x')
        dadY = getProperty('dad.y')
        if not lowQuality then
            objectPlayAnimation('ChamberPebles','blue',true)
        end
        setProperty('skipCountdown',true)

    else
        setProperty('Chamber.animation.curAnim.curFrame',25)
    end
end

function onUpdate()
    if cutsceneStage == 1 then
        setProperty('Chamber.animation.curAnim.frameRate',0)
        setProperty('dad.x',getProperty('Chamber.x') + getProperty('Chamber.width')/2 - 100)
        setProperty('dad.y',getProperty('Chamber.y') + getProperty('Chamber.height')/2.5)
    end
    if cutsceneStage > 0 then
        triggerEvent('Camera Follow Pos',getProperty('Chamber.x') + getProperty('Chamber.width')/2 + 100,getProperty('Chamber.y') +  getProperty('Chamber.height')/2 - 250)
    end
end

local allowCountDown = false
function onStartCountdown()
    if songName == 'chaos' and allowCountDown == false then
        return Function_Stop
    end
    if allowCountDown == true then
        return Function_Continue
    end
end
function onTimerCompleted(tag)
    if tag == 'wowJumpscareSonic' then
        cutsceneStage = 2
        playSound('robot')
        if not lowQuality then
            addLuaSprite('wowRedChamber',true)
            doTweenAlpha('redScreenDestroy','wowRedChamber',0,0.5,'linear')
        end
        runTimer('sonicFall',1)
    end
    if tag == 'sonicFall' then
        setProperty('Chamber.animation.curAnim.frameRate',22)
        playSound('sonic')
        runTimer('FleetwayAppear',4)
    end
    if tag == 'FleetwayAppear' then
        if not lowQuality then
            addLuaSprite('wowYellowChamber',true)
            doTweenAlpha('yellowScreenDestroy','wowYellowChamber',0,0.5,'linear')
        end
        playSound('beam')
        cameraShake('game',0.05,0.3)
        objectPlayAnimation('ChamberRock','yellow',true)
        objectPlayAnimation('ChamberFloor','yellow',true)
        objectPlayAnimation('ChamberRock','yellow',true)
        if not lowQuality then
            objectPlayAnimation('ChamberPebles','yellow',true)
        end
        removeLuaSprite('ChamberRainEmerald',true)
        setProperty('ChamberRainEmerald2.alpha',1)
        runTimer('startSong',2)
    end
    if tag == 'startSong' then
        
        allowCountDown = true
        startCountdown()
        runTimer('dadBacktoPosition',1.6)
        triggerEvent('Camera Follow Pos','','')
    end
    if tag == 'dadBacktoPosition' then
        cutsceneStage = 0
        doTweenY('sonicFleetwayY','dad',dadY,2,'quartOut')
        doTweenX('sonicFleetwayX','dad',dadX,2,'quartOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'yellowScreenDestroy' then
        removeLuaSprite('wowYellowChamber',true)
    end
    if tag == 'redScreenDestroy' then
        removeLuaSprite('wowRedChamber',true)
    end
end

function onStepHit()
    if songName == 'chaos' then
        if curStep == 60 then
            doTweenAlpha('backHUD','camHUD',1,0.5,'linear')
        end
        if curStep == 10 then
            doTweenY('sonicFleetwayY','dad',getProperty('Chamber.y') - getProperty('Chamber.height')/2 - 300,1,'quartOut')
            doTweenX('sonicFleetwayX','dad',getProperty('Chamber.x') + getProperty('Chamber.width')/2 - 100,1,'quartOut')
        end
        if curStep == 1008 then
            objectPlayAnimation('Chamber','broked')
        end
    end
end