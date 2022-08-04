function onCreate()
    makeLuaSprite('FakerBG','fakerBG/sky',-800,-800)
    scaleObject('FakerBG',1.3,1.3)
    setScrollFactor('FakerBG',0.8,0.8)
    addLuaSprite('FakerBG')


    makeLuaSprite('FakerMountain','fakerBG/mountains',-100,-600)
    setScrollFactor('FakerMountain',0.9,0.9)
    addLuaSprite('FakerMountain')

    makeLuaSprite('FakerGround','fakerBG/grass',-300,-800)
    scaleObject('FakerGround',1,1.2)
    addLuaSprite('FakerGround')
    for objects = 1,2 do
        makeLuaSprite('FakerPillar'..objects,'fakerBG/pillar'..objects,-100,-600)

        
        
        makeLuaSprite('FakerTree'..objects,'fakerBG/tree'..objects,-100,-600)
        addLuaSprite('FakerPillar'..objects)
        addLuaSprite('FakerTree'..objects)
    end
    makeLuaSprite('FakerFlower1','fakerBG/flower1',-100,-600)
    addLuaSprite('FakerFlower1')
    makeLuaSprite('FakerFlower2','fakerBG/flower2',-300,-600)
    addLuaSprite('FakerFlower2')
end