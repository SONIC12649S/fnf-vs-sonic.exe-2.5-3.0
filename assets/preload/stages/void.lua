function onCreatePost()
    makeLuaSprite('whiteBg','',0 - (getProperty('defaultCamZoom') * 100),0 - (getProperty('defaultCamZoom') * 100))
    setScrollFactor('whiteBg',0,0)
    scaleObject('whiteBg',1 + (getProperty('defaultCamZoom') * 100),1 + (getProperty('defaultCamZoom') * 100))
    makeGraphic('whiteBg',screenWidth,screenHeight,'FFFFFF')
    addLuaSprite('whiteBg')
end