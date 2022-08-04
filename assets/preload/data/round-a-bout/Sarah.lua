local animOffset = {-190,-100,-60,-195,-40,-118,-208,-70,-40,-214}
function onCreatePost()
    makeAnimatedLuaSprite('SarahCharacter','characters/Sarah',-80,-280)
    --setProperty('SarahCharacter.alpha',0.001)
    scaleObject('SarahCharacter',1.2,1.2)
    addAnimationByPrefix('SarahCharacter','idle','Sarah_IDLE',24,false)
    addAnimationByPrefix('SarahCharacter','singLEFT','Sarah_LEFT',24,false)
    addAnimationByPrefix('SarahCharacter','singDOWN','Sarah_DOWN',24,false)
    addAnimationByPrefix('SarahCharacter','singUP','Sarah_UP',24,false)
    addAnimationByPrefix('SarahCharacter','singRIGHT','Sarah_RIGHT',24,false)
    addLuaSprite('SarahCharacter',false)
end
function onUpdate()
    objectPlayAnimation('SarahCharacter',getProperty('dad.animation.curAnim.name'),false)
    if getProperty('SarahCharacter.animation.curAnim.name') == 'idle' then
        setProperty('SarahCharacter.offset.x',animOffset[1])
        setProperty('SarahCharacter.offset.y',animOffset[2])
    elseif getProperty('SarahCharacter.animation.curAnim.name') == 'singLEFT' then
        setProperty('SarahCharacter.offset.x',animOffset[3])
        setProperty('SarahCharacter.offset.y',animOffset[4])
    elseif getProperty('SarahCharacter.animation.curAnim.name') == 'singDOWN' then
        setProperty('SarahCharacter.offset.x',animOffset[5])
        setProperty('SarahCharacter.offset.y',animOffset[6])
    elseif getProperty('SarahCharacter.animation.curAnim.name') == 'singUP' then
        setProperty('SarahCharacter.offset.x',animOffset[7])
        setProperty('SarahCharacter.offset.y',animOffset[8])
    elseif getProperty('SarahCharacter.animation.curAnim.name') == 'singRIGHT' then
        setProperty('SarahCharacter.offset.x',animOffset[9])
        setProperty('SarahCharacter.offset.y',animOffset[10])
    end
end
function opponentNoteHit()
    setProperty('SarahCharacter.animation.curAnim.curFrame',0)
end
function onStepHit()
    if curStep == 764 then
        doTweenAlpha('helloSarah','SarahCharacter',0.7,0.5,'linear')
    end
end
function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('SarahCharacter','idle',true)
    end
end
