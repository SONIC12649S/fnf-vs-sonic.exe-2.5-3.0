function onCreate()
    makeLuaSprite('NeedleSky','needlemouse/sky',-900,-500)
    scaleObject('NeedleSky',1.35,1.35)
    setScrollFactor('NeedleSky',0.8,0.8)
    addLuaSprite('NeedleSky')

    makeLuaSprite('NeedleMountains','needlemouse/mountains',-900,-800)
    scaleObject('NeedleMountains',1.35,1.35)
    setScrollFactor('NeedleMountains',0.9,0.9)
    addLuaSprite('NeedleMountains')

    makeLuaSprite('NeedleBuildings','needlemouse/buildings',-800,-600)
    scaleObject('NeedleBuildings',1.2,1.2)
    addLuaSprite('NeedleBuildings')

    makeLuaSprite('NeedleFront','needlemouse/fg',-800,-600)
    scaleObject('NeedleFront',1.2,1.2)
    setScrollFactor('NeedleFront',1.05,1.05)
    addLuaSprite('NeedleFront',true)

    
    makeLuaSprite('NeedleRuins','needlemouse/ruins',-900,-900)
    scaleObject('NeedleRuins',1.35,1.35)
    addLuaSprite('NeedleRuins')
    
    makeLuaSprite('NeedleGround','needlemouse/CONK_CREET',-900,-900)
    scaleObject('NeedleGround',1.35,1.35)
    addLuaSprite('NeedleGround')

end