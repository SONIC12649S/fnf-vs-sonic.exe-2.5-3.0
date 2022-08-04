function onCreate()
    makeLuaSprite('FakerExeBG','exeBg/sky',-800,-500)
    scaleObject('FakerExeBG',1.3,1.3)
    setScrollFactor('FakerExeBG',0.9,0.9)

    makeLuaSprite('FakerExeBg2','exeBg/ground',-100,-800)
    scaleObject('FakerExeBg2',1.2,1.2)

    makeLuaSprite('FakerExeTails','exeBg/TailsCorpse',915,150)

    makeAnimatedLuaSprite('FakerExeGround','exeBg/ExeAnimatedBG_Assets',-200,-800)
    addAnimationByPrefix('FakerExeGround','anim','ExeBGAnim',24,true)
    scaleObject('FakerExeGround',1.15,1.15)

    addLuaSprite('FakerExeBG')
    addLuaSprite('FakerExeBg2')
    addLuaSprite('FakerExeGround')
    addLuaSprite('FakerExeTails')
end