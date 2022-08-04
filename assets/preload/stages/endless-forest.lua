function onCreate()
    makeLuaSprite('endlessSky','FunInfiniteStage/sonicFUNsky',-360,0)
    setProperty('endlessSky.antialiasing',false)
    scaleObject('endlessSky',0.85,0.85)
    addLuaSprite('endlessSky')
    if not lowQuality then
        makeAnimatedLuaSprite('endlessTreeBack','FunInfiniteStage/Majin Boppers Back',200,-190)
        addAnimationByPrefix('endlessTreeBack','tree','MajinBop2 instance 1',24,false)
        addLuaSprite('endlessTreeBack')
    end

    makeLuaSprite('endlessBG','FunInfiniteStage/Bush 1',0,600)
    addLuaSprite('endlessBG')

    makeLuaSprite('endlessBG2','FunInfiniteStage/Bush2',0,400)
    addLuaSprite('endlessBG2')

    makeAnimatedLuaSprite('endlessTreeFront2','FunInfiniteStage/Majin Boppers Front',-145,-190)
    addAnimationByPrefix('endlessTreeFront2','tree','MajinBop1 instance 1',24,false)
    addLuaSprite('endlessTreeFront2')

    makeAnimatedLuaSprite('endlessTreeFront','FunInfiniteStage/Majin Boppers Front',650,-200)
    addAnimationByPrefix('endlessTreeFront','tree','MajinBop1 instance 1',24,false)
    addLuaSprite('endlessTreeFront')


    makeLuaSprite('endlessGround','FunInfiniteStage/floor BG',-360,690)
    addLuaSprite('endlessGround')
    if not lowQuality then
        makeAnimatedLuaSprite('endlessSonic','FunInfiniteStage/majin FG2',-300,800)
        addAnimationByPrefix('endlessSonic','idle','majin front bopper2',24,false)
        addLuaSprite('endlessSonic',true)
        setScrollFactor('endlessSonic',1.1,1.1)

        makeAnimatedLuaSprite('endlessSonic2','FunInfiniteStage/majin FG1',1000,800)
        addAnimationByPrefix('endlessSonic2','idle','majin front bopper1',24,false)
        addLuaSprite('endlessSonic2',true)
        setScrollFactor('endlessSonic2',1.1,1.1)
    end
end

function onBeatHit()
    objectPlayAnimation('endlessTreeBack','tree',true)
    objectPlayAnimation('endlessTreeFront','tree',true)
    objectPlayAnimation('endlessTreeFront2','tree',true)
    objectPlayAnimation('endlessSonic','idle',true)
    objectPlayAnimation('endlessSonic2','idle',true)
end