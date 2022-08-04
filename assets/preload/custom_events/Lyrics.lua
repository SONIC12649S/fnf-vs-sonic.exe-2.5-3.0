local disableLyrics = false
local colorLyrics = nil
local textLyrics = ''

local LyricsInExecutation = false
function onCreate()
    makeLuaSprite('blackBorderLyrics1','',0,-170)
    makeLuaSprite('blackBorderLyrics2','',0,720)

    for blackBorders = 1,2 do
        makeGraphic('blackBorderLyrics'..blackBorders,screenWidth,170,'000000')
        setObjectCamera('blackBorderLyrics'..blackBorders,'other')
        addLuaSprite('blackBorderLyrics'..blackBorders,true)
    end
end
function onUpdate()
    for eventNotes = 0,getProperty('eventNotes.length')-1 do
        if getPropertyFromGroup('eventNotes',eventNotes,'strumTime') - getSongPosition() < 250 and getPropertyFromGroup('eventNotes',eventNotes,'event') == 'Lyrics' and LyricsInExecutation == false then
            doTweenY('comeBlack1','blackBorderLyrics1',0,2,'quartOut')
            doTweenY('comeBlack2','blackBorderLyrics2',screenHeight - 170,2,'quartOut')
            for blackBorders = 1,2 do
                addLuaSprite('blackBorderLyrics'..blackBorders,false)
            end
            LyricsInExecutation = true
        end
    end
    if disableLyrics == true then
        setProperty('LyricsWow.alpha',getProperty('LyricsWow.alpha') - 0.05)
    end
end
function onEvent(name,v1,v2)
    if name == 'Lyrics' then
        textLyrics = v1
        if string.find(v1,'-') ~= nil and string.find(v1,'-') ~= '' then
            colorLyrics = string.sub(textLyrics,string.find(textLyrics,'-')/1 + 2)
            textLyrics = string.gsub(textLyrics,string.sub(textLyrics,string.find(textLyrics,'-')/1),'')
        else
            colorLyrics = 'FFFFFF'
        end
        makeLuaText('LyricsWow',textLyrics,1280,0,600)
        setTextColor('LyricsWow',colorLyrics)
        setTextBorder('LyricsWow',0.1,colorLyrics)

        setProperty('LyricsWow.scale.x',1.5)
        setProperty('LyricsWow.scale.y',1.5)
        if getPropertyFromClass('PlayState','isPixelStage') == true then
            setProperty('LyricsWow.antialiasing',false)
            setTextFont('LyricsWow','sonic-1-hud-font.ttf')
            setProperty('LyricsWow.scale.x',2.2)
            setProperty('LyricsWow.scale.y',2)
        else
            setTextBorder('LyricsWow',0,colorLyrics)
        end
        disableLyrics = false
        LyricsInExecutation = true
        runTimer('removeLyricsEvent',v2)
        setProperty('LyricsWow.alpha',1)
        runTimer('removeLyricsBars',v2 + 2)
        setObjectCamera('LyricsWow','other')
        setObjectOrder('LyricsWow',getObjectOrder('blackBorderLyrics2') + 1)
        addLuaText('LyricsWow',true)
  
    elseif name == 'Close Lyrics' and LyricsInExecutation == true then
        LyricsInExecutation = false
        disableLyrics = true
        backBorders()
    end
end
function onTimerCompleted(tag)
    if tag == 'removeLyricsEvent' then
        disableLyrics = true
    end
end
function backBorders()
    doTweenY('backBlack1','blackBorderLyrics1',-170,2,'quartOut')
    doTweenY('backBlack2','blackBorderLyrics2',screenHeight,2,'quartOut')
end
function onTweenCompleted(tag)
    for blackBorders = 1,2 do
        if tag == 'backBlack'..blackBorders then
            removeLuaSprite('blackBorderLyrics'..blackBorders,false)
            LyricsInExecutation = false
        end
    end
end
