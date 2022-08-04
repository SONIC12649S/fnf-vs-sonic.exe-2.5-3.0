local animtime = 0
function onUpdate()
    if getProperty('boyfriend.curCharacter') == 'bf-needle' then
        if getProperty('boyfriend.animation.curAnim.finished') == true and string.match(getProperty('boyfriend.animation.curAnim.name'),'miss') == 'miss' then
            if curBeat %2 == 0 or curBeat and curBeat %4 ~= 0 or curBeat %3 == 0 and curBeat %4 ~= 0 then
             characterPlayAnim('boyfriend','danceRight')
            elseif curBeat % 4 == 0 then
                characterPlayAnim('boyfriend','danceLeft')
            end
        end
    end
    if animtime > 0 then
        animtime = animtime - 0.1
    end
    if animtime <= 0 then
        if getProperty('boyfriend.curCharacter') == 'bf-running-sonic' or getProperty('boyfriend.curCharacter') == 'bf-Sonic-Peelout' then
            if string.match(getProperty('boyfriend.animation.curAnim.name'),'miss') == 'miss' then
               characterPlayAnim('boyfriend','idle')
            end
        end
        animtime = 0
    end
end
function noteMiss()
    if getProperty('boyfriend.curCharacter') == 'bf-running-sonic' or getProperty('boyfriend.curCharacter') == 'bf-Sonic-Peelout' then
        animtime = 6.1
    end
end