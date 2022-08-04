local changedImage = false
local disableImage = false
function onCreate()
        if string.lower(songName) ~= 'sanic' and
        string.lower(songName)  ~= 'chaos'  and
        string.lower(songName)  ~= 'soulless-nikocover' and
        string.lower(songName)  ~= 'soulless-orycover' and
        string.lower(songName)  ~= 'soulless' and
        string.lower(songName)  ~= 'fatality' and
        string.lower(songName)  ~= 'too-slow-encore' and
        string.lower(songName)  ~= 'endless-encore' and
        string.lower(songName)  ~= 'sunshine' and
        string.lower(songName)  ~= 'milk' and
        string.lower(songName)  ~= 'too-fest' and
        string.match(string.lower(songName),'milk') ~= 'milk' and
        string.lower(songName)  ~= 'cycles-encore' then
        startSonicCount(string.lower(songName))
        elseif string.lower(songName)  == 'cycles-encore' then
            startSonicCount('cycles')
        elseif string.lower(songName)  == 'too-slow-encore' then
            startSonicCount('too-slow')
        elseif string.lower(songName)  == 'endless-encore' then
        startSonicCount('endless')
        elseif string.lower(songName) == 'fatality' then
            changeCountDown('-Fatal','StartScreens/fatal_',true,true,false,true,3,3,600,350)
        elseif string.lower(songName) == 'sunshine' then
            changeCountDown('-Tails','StartScreens/tails_',true,true,false,true,1,1,300,230)
        elseif string.match(string.lower(songName),'soulless') == 'soulless' then
            changeCountDown('-silence','',true,false,true,true,1,1,300,230)
        elseif string.match(string.lower(songName),'milk') == 'milk' then
            milkCountDown('milk')
        end
end
function startSonicCount(name)
    if string.match(name, " ") ~= nil then
        name = string.gsub(name," ","-")--This will replace the space with a trace
    end
    setProperty('introSoundsSuffix','-silence')
    makeLuaSprite('blackScreenSonicCount','',0,0)
    setObjectCamera('blackScreenSonicCount','other')
    makeGraphic('blackScreenSonicCount',screenWidth,screenHeight,'000000')
    addLuaSprite('blackScreenSonicCount',true)
    makeLuaSprite('startCircle','StartScreens/Circle-'..name,800,00)
    setObjectCamera('startCircle','other')
    addLuaSprite('startCircle',true)
    makeLuaSprite('startText','StartScreens/Text-'..name,-800,00)
    setObjectCamera('startText','other')
    addLuaSprite('startText',true)
    setObjectCamera('startText','other')
    addLuaSprite('startText',true)
    runTimer('tweenWow',0.2)
    runTimer('tween2',getPropertyFromClass('Conductor','crochet')/ 1000 * 5)
end
function milkCountDown(name)
    if string.match(name, " ") ~= nil then
        name = string.gsub(name," ","-")--This will replace the space with a trance
    end
    setProperty('introSoundsSuffix','-silence')
    makeLuaSprite('blackScreenSonicCount','',0,0)
    setObjectCamera('blackScreenSonicCount','other')
    makeGraphic('blackScreenSonicCount',screenWidth,screenHeight,'000000')
    addLuaSprite('blackScreenSonicCount',true)
    makeLuaSprite('startCircle','StartScreens/Circle-'..name,0,0)
    setProperty('startCircle.scale.x',0)
    setObjectCamera('startCircle','other')
    addLuaSprite('startCircle',true)
    runTimer('tweenMajin',0.2)
    runTimer('tween2',getPropertyFromClass('Conductor','crochet')/ 1000 * 5)
end
function onTimerCompleted(tag)
    if tag == 'tweenWow' then
        doTweenX('circleX','startCircle',0,0.6,'quartOut')
        doTweenX('textX','startText',0,0.6,'quartOut')
        --doTweenX('circleX','startCircle',0,0.7,'linear')
        --doTweenX('textX','startText',0,0.7,'linear')
    end
    if tag == 'tweenMajin' then
        doTweenX('circleX','startCircle.scale',1,0.4,'bounceOut')
        playSound('flatBONK')
        --doTweenX('circleX','startCircle',0,0.7,'linear')
        --doTweenX('textX','startText',0,0.7,'linear')
    end
    if tag == 'tween2' then
        --doTweenX('circleX','startCircle',-900,0.7,'quartOut')
        --doTweenX('textX','startText',1200,0.7,'quartOut')
        doTweenAlpha('blackScreenDestroy','blackScreenSonicCount',0,0.5,'linear')
        runTimer('tweenCircle',0.5)
    end
    if tag == 'tweenCircle' then
        doTweenAlpha('circleDestroy','startCircle',0,0.5,'linear')
        doTweenAlpha('textDestroy','startText',0,0.5,'linear')
    end
end
function onCountdownTick(counter)
    if counter > 0 then
        addLuaSprite('customIntro'..counter)
        doTweenAlpha('byeCustomIntro'..counter,'customIntro'..counter,0,getPropertyFromClass('Conductor','crochet')/ 1000,'linear')
        if counter == 1 then
            if disableImage == true then
                setProperty('countdownReady.visible',false)
            end
            if changedImage == true then
                doTweenAlpha('byeReady','customIntro'..counter,0,0.5,'linear')
            end
        elseif counter == 2 then
            if disableImage == true then
                setProperty('countdownSet.visible',false)
            end
            removeLuaSprite('customIntro'..counter - 1,true)
        elseif counter == 3 then
            if disableImage == true then
                setProperty('countdownGo.visible',false)
            end
            removeLuaSprite('customIntro'..counter -1,true)
        end
    end
 
end
function changeCountDown(name,image,changeSong,changeImage,disableSoundCount,disableCountDownImage,scaleX,scaleY,posX,posY)
    disableImage = disableCountDownImage
    if changeSong == true then
        setProperty('introSoundsSuffix',name)
    end
    if changeImage == true then
        changedImage = true
        for countDown = 1,2 do
            makeLuaSprite('customIntro'..countDown,image..countDown,posX,posY)
            setObjectCamera('customIntro'..countDown,'hud')
            setProperty('customIntro'..countDown..'.scale.x',scaleX)
            setProperty('customIntro'..countDown..'.scale.y',scaleY)
        end
        makeLuaSprite('customIntro3',image..'go',posX,posY)
        setObjectCamera('customIntro3','hud')
        setProperty('customIntro3.scale.x',scaleX)
        setProperty('customIntro3.scale.y',scaleY)
    end
end
function onTweenCompleted(tag)
    if tag == 'circleDestroy' then
        removeLuaSprite('startCircle',true)
        removeLuaSprite('startText',true)
        removeLuaSprite('blackScreenSonicCount',true)
    end
    if tag == 'byeCustomIntro3' then
        removeLuaSprite('customIntro3',true)
    end
end