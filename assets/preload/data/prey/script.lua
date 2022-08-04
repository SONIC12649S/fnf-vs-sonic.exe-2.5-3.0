local byeSonic = false
function onCreate()

    setProperty('dad.x',-400)

    makeAnimatedLuaSprite('MechaIThink','characters/Furnace_sheet',-600,850)
    setProperty('MechaIThink.antialiasing',false)
    addAnimationByPrefix('MechaIThink','idle','Furnace idle',24,true)
    scaleObject('MechaIThink',6,6)


    makeLuaSprite('MechaIThink2','furnace_gotcha',2200,430)
    precacheImage('furnace_gotcha')
    setProperty('MechaIThink2.flipX',true)
    setProperty('MechaIThink2.antialiasing',false)
    scaleObject('MechaIThink2',6,6)

    makeLuaSprite('wowRed','',0,0)
    setObjectCamera('wowRed','hud')
    makeGraphic('wowRed',screenWidth,screenHeight,'FF0000')

    
    makeLuaSprite('wowBlack','',0,0)
    setObjectCamera('wowBlack','hud')
    makeGraphic('wowBlack',screenWidth,screenHeight,'000000')
end
function onCreatePost()
    precacheSong('PreyLyrics/Lyrics')
    precacheSong('PreyLyrics/Lyrics2')
end
function onStepHit()
    if curStep < 20 then
        setProperty('dad.alpha',0)
    elseif curStep == 32 then
        setProperty('dad.alpha',1)
    end
    if curStep == 249 then
        doTweenX('backMecha','dad',100,1,'quartOut')
    end

    if curStep == 1508 then
        doTweenX('byeMechaRemastered','dad',-600,2.5,'quartInOut')
        doTweenAngle('byeMechaRemasteredAngle','dad',-180,3.5,'quartInOut')

    end
    if curStep == 1546 then
        playSound('PreyLyrics/Lyrics')
    end
    if curStep == 3335 then
        playSound('PreyLyrics/Lyrics2')
    end
    if curStep == 1576 then
        doTweenX('helloEggHead','dad',1100,2,'quartOut')
    end
    if curStep == 2448 then
        addLuaSprite('MechaIThink',false)
        doTweenX('rightMecha','MechaIThink',2200,5,'linear')
    end
    if curStep == 3328 then
        
        doTweenX('byeEggHead','dad',-500,2.5,'quartInOut')
    end
    if curStep == 3364 then
        addLuaSprite('MechaIThink2',true)
        byeSonic = true
    end
    if curStep == 3367 then
        setProperty('camGame.visible',false)
        addLuaSprite('wowBlack')
        addLuaSprite('wowRed')
        doTweenAlpha('redBye','wowRed',0,1.5,'linear')

    end
end
function onEvent(name,v1,v2)
    if name == 'Change Character' then
        if v2 == 'starved-pixel' and v1 == 'dad' then
            setProperty('dad.x',-500)
            setProperty('dad.y',-200)
        end
    end
end

function onUpdate()
    if byeSonic == true and getProperty('MechaIThink2.x') > getProperty('boyfriend.x') then
        setProperty('MechaIThink2.x',getProperty('MechaIThink2.x') - 80)
    end
end
function onTweenCompleted(tag)
    if tag == 'rightMecha' then
        removeLuaSprite('MechaIThink',true)
    end
end