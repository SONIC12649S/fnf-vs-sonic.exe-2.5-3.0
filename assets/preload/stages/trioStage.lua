local stagelevel = 0
function onCreate()
    
    makeLuaSprite('TrioGlitch','Phase3/Normal/glitch',-600,-500)
    makeLuaSprite('TrioBG','Phase3/Normal/BackBush',-600,-500)
    scaleObject('TrioBG',1.2,1.2)
    setScrollFactor('TrioBG',0.9,0.9)
    makeLuaSprite('TrioTTTrees','Phase3/Normal/TTTrees',-600,-500)
    setScrollFactor('TrioTTTrees',0.8,0.8)
    scaleObject('TrioTTTrees',1.2,1.2)
    makeLuaSprite('TrioTree','Phase3/Normal/FGTree1',-720,-500)
    setScrollFactor('TrioTree',1.1,1)
    makeLuaSprite('TrioTree2','Phase3/Normal/FGTree2',-400,-500)
    setScrollFactor('TrioTree2',1.1,1)
    makeLuaSprite('TrioGround','Phase3/Normal/TopBushes',-600,-600)
    scaleObject('TrioGround',1.2,1.2)



 
    if songName == 'triple-trouble' then
        makeAnimatedLuaSprite('XenoGlitch','Phase3/NewTitleMenuBG',-450,-250)
        scaleObject('XenoGlitch',4.2,4.2)
        setProperty('XenoGlitch.antialiasing',false)
        addAnimationByPrefix('XenoGlitch','WowSky','TitleMenuSSBG',24,true)
        addLuaSprite('XenoGlitch',false)
        setProperty('XenoGlitch.visible',false)

        makeLuaSprite('XenoBackTrees','Phase3/xeno/BackTrees',-600,-500)
        setScrollFactor('XenoBackTrees',0.8,0.8)
        scaleObject('XenoBackTrees',1.2,1.2)
        setProperty('XenoBackTrees.visible',false)
        
        makeLuaSprite('XenoGround','Phase3/xeno/Grass',-600,-600)
        scaleObject('XenoGround',1.2,1.2)
        setProperty('XenoGround.visible',false)

        addLuaSprite('XenoGlitch')
        addLuaSprite('XenoBackTrees')
        addLuaSprite('XenoGround')
    end
    addLuaSprite('TrioGlitch')
    addLuaSprite('TrioTTTrees',false)
    addLuaSprite('TrioBG',false)
    addLuaSprite('TrioGround',false)
    addLuaSprite('TrioTree',true)
    addLuaSprite('TrioTree2',true)
end
function onStepHit()
    if songName == 'triple-trouble' then
        if curStep == 1040 or curStep == 2320 or curStep == 4112 then
            setProperty('defaultCamZoom',0.9)
            setProperty('TrioGlitch.visible',false)
            setProperty('TrioGround.visible',false)
            setProperty('TrioBG.visible',false)
            setProperty('TrioTree.visible',false)
            setProperty('TrioTree2.visible',false)
            setProperty('TrioTTTrees.visible',false)

            setProperty('XenoGlitch.visible',true)
            setProperty('XenoBackTrees.visible',true)
            setProperty('XenoGround.visible',true)
        end
        if curStep == 1296 or curStep == 2832 then
            setProperty('defaultCamZoom',0.65)
            setProperty('TrioGlitch.visible',true)
            setProperty('TrioGround.visible',true)
            setProperty('TrioBG.visible',true)
            setProperty('TrioTree.visible',true)
            setProperty('TrioTree2.visible',true)
            setProperty('TrioTTTrees.visible',true)

            setProperty('XenoGlitch.visible',false)
            setProperty('XenoBackTrees.visible',false)
            setProperty('XenoGround.visible',false)
        end
        if curStep == 1296 and middlescroll == false then
            for strums = 0,4 do
                setPropertyFromGroup('playerStrums', strums,'x',92 + (112 * strums))
                setPropertyFromGroup('opponentStrums', strums,'x',732 + (112 * strums))
            end
        end
        if curStep == 2832 then
            setProperty('XenoGround.flipX',false)
            if middlescroll == false then
                for strums = 0,4 do
                    setPropertyFromGroup('playerStrums', strums,'x',732 + (112 * strums))
                    setPropertyFromGroup('opponentStrums', strums,'x',92 + (112 * strums))
                end
            end
        end
        if curStep == 2320 then
            setProperty('XenoGround.flipX',true)
        end
        if curStep == 4112 then
            removeLuaSprite('TrioGlitch',true)
            removeLuaSprite('TrioBG',true)
            removeLuaSprite('TrioTree',true)
            removeLuaSprite('TrioTree2',true)
            removeLuaSprite('TrioTTTrees',true)
        end
    end
end