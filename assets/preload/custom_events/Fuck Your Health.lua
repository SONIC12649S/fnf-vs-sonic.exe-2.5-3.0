-- Event notes hooks
function onEvent(name, value1, value2)
    local var hideme = tonumber(value1)
    local var aughgh = tonumber(value2)
    if name == "Fuck Your Health" then
        if hideme == 1 then
            doTweenAlpha('fuckYourHealthTween','healthBar', 0, 0.3, 'linear')
            doTweenAlpha('fuckYourHealthIconP1Tween','iconP1', 0, 0.3, 'linear')
            doTweenAlpha('fuckYourHealthIconP2Tween','iconP2', 0, 0.3, 'linear')
        end
        if hideme == 0 then
            doTweenAlpha('fnowaitHealthTween','healthBar', 1, 0.3, 'linear') 
            doTweenAlpha('noWaitHealthIconP1Tween','iconP1', 1, 0.3, 'linear')
            doTweenAlpha('noHoldonHealthIconP2Tween','iconP2', 1, 0.3, 'linear')
        end
    end
end

-- For some ungodly reason this doesn't work unless opponent hits a note?
-- why please ugh