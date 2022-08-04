local curGameOver = nil

local songsState = 0
function onUpdate()
    if getProperty('dad.curCharacter') == 'starved' then
        setPropertyFromClass('GameOverSubstate','characterName','starved-die')
        setPropertyFromClass('GameOverSubstate','deathSoundName','starved-death')
        setPropertyFromClass('GameOverSubstate','loopSoundName','staticBUZZ')
        curGameOver = 'starved'
    end
    if getProperty('boyfriend.curCharacter') == 'bf-fatal' then
        setPropertyFromClass('GameOverSubstate','characterName','bf-fatal-death')
        setPropertyFromClass('GameOverSubstate','deathSoundName','fatal-death')
        setPropertyFromClass('GameOverSubstate','loopSoundName','starved-loop')
        curGameOver = 'fatal'
    end
    if getProperty('boyfriend.curCharacter') == 'bf-needle' then
        setPropertyFromClass('GameOverSubstate','characterName','bf-needle-die')
        setPropertyFromClass('GameOverSubstate','loopSoundName','needlemouse-loop')
        setPropertyFromClass('GameOverSubstate','endSoundName','needlemouse-retry')
        
        curGameOver = 'needle'
    end
    if getProperty('boyfriend.curCharacter') == 'bf-running-sonic' or getProperty('boyfriend.curCharacter') == 'bf-Sonic-Peelout' then
        setPropertyFromClass('GameOverSubstate','characterName','bf-sonic-gameover')
        setPropertyFromClass('GameOverSubstate','deathSoundName','prey-death')
        setPropertyFromClass('GameOverSubstate','loopSoundName','prey-loop')
        setPropertyFromClass('GameOverSubstate','endSoundName','prey-retry')
        curGameOver = 'prey'
    end
    if songsState == 1 and curGameOver == 'prey' then
        if getProperty('boyfriend.animation.curAnim.curFrame') == 15 then
            playSound('SonicDash')
            songsState = 2
        end
    end
end
function onGameOverConfirm()
    if songsState == 0 and curGameOver == 'prey' then
        playSound('SonicJump')
        songsState = 1
    end
end