function onCreate()
    makeLuaSprite('cyclesSky','LordXStage/sky',-440,-80)
    addLuaSprite('cyclesSky')
    setProperty('cyclesSky.alpha',0.5)
    scaleObject('cyclesSky',1.0,1.0)
    setScrollFactor('cyclesSky',0.9,0.9)

    makeLuaSprite('cyclesMontain','LordXStage/hills1',-610,-0)
    scaleObject('cyclesMontain',0.55,0.55)
    addLuaSprite('cyclesMontain')
    setScrollFactor('cyclesMontain',0.95,0.95)

    makeLuaSprite('cyclesGround','LordXStage/floor',-390,100)
    scaleObject('cyclesGround',1.25,1.25)
    addLuaSprite('cyclesGround')

    makeAnimatedLuaSprite('cyclesNotKnux','LordXStage/NotKnuckles_Assets',100,50)
    addAnimationByPrefix('cyclesNotKnux','hands','Notknuckles',24,true)
    scaleObject('cyclesNotKnux',0.55,0.55)
    addLuaSprite('cyclesNotKnux')
    if not lowQuality then
        makeAnimatedLuaSprite('cyclesTree2','LordXStage/WeirdAssFlower_Assets',-450,220)
        addAnimationByPrefix('cyclesTree2','tree','flower',24,true)
        scaleObject('cyclesTree2',0.8,0.8)
        addLuaSprite('cyclesTree2')

        makeLuaSprite('cyclesPlant','LordXStage/smallflower',-735,-40)
        scaleObject('cyclesPlant',0.6,0.6)
        addLuaSprite('cyclesPlant')

        makeLuaSprite('cyclesPlant2','LordXStage/smallflower2',-735,-40)
        scaleObject('cyclesPlant2',0.6,0.6)
        addLuaSprite('cyclesPlant2')

        
        makeLuaSprite('cyclesTree','LordXStage/tree',-550,-200)
        scaleObject('cyclesTree',0.65,0.65)
        addLuaSprite('cyclesTree')
    end
end