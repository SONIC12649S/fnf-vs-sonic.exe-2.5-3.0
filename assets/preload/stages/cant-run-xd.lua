function onCreate()
    makeLuaSprite('RunSky','run/Sky',-600,-500)
    makeLuaSprite('RunBG','Phase3/Normal/BackBush',-600,-500)
    scaleObject('RunBG',1.2,1.2)
    setScrollFactor('RunBG',0.9,0.9)
    makeLuaSprite('RunTrees','run/trees',-650,-200)
    setScrollFactor('RunTrees',1.1,1)
    makeLuaSprite('RunTreesFront','run/TreesFront',-650,-300)
    scaleObject('RunTreesFront',1.1,1.1)
    setScrollFactor('RunTreesFront',1.2,1)
    makeLuaSprite('RunGround','Phase3/Normal/TopBushes',-600,-200)
    makeLuaSprite('RunTopOverlay','run/TopOverlay',-650,-150)

    addLuaSprite('RunSky')
    addLuaSprite('RunBG',false)
    addLuaSprite('RunTrees',false)
    addLuaSprite('RunGround',false)
    addLuaSprite('RunTreesFront',true)
    addLuaSprite('RunTopOverlay',true)
end
function onEvent(name,v1)
    if name == 'Genesis' then
       if string.lower(v1) ~= 'false' then
           setProperty('RunTopOverlay.visible',false)
           setProperty('RunTreesFront.visible',false)
       else
        setProperty('RunTopOverlay.visible',true)
        setProperty('RunTreesFront.visible',true)
       end
    end
end