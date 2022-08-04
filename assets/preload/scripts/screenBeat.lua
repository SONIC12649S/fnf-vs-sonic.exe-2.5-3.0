local BeatPorcent = 0
local BeatStyle = 0
local BeatStrentghGame = 0.02
local BeatStrentghHUD = 0.04

local Beated = false

function onStepHit()
    if curStep/4 % BeatPorcent == 0 then
        if BeatStyle == 0 then
            if Beated == false then
                Beated = true
                triggerEvent('Add Camera Zoom',BeatStrentghGame,BeatStrentghHUD)
            end
        elseif BeatStyle == 1 then
            if (curStep/4) % 4 ~= 0 then
                if  curStep/4 % BeatPorcent == 0 and Beated == false then
                    triggerEvent('Add Camera Zoom',BeatStrentghGame  * BeatValue,BeatStrentghHUD * BeatValue)
                    BeatValue = BeatValue * -1
                    Beated = true
                end
            else
                if (curStep/4) % BeatPorcent == 0 and Beated == false then
                    triggerEvent('Add Camera Zoom',BeatStrentghGame * BeatValue + (0.025 * BeatValue),BeatStrentghHUD * BeatValue + (0.03 * BeatValue))
                    BeatValue = BeatValue * -1
                    Beated = true
                end
            end
        end
    else
        Beated = false
    end
    if songName == 'too-slow-encore' then
        if curStep == 416 then
            BeatPorcent = 1
        end
        if curStep == 1888 then
            BeatPorcent = 0
        end
    end
    if songName == 'you-cant-run' then
        if curStep == 15 then
            BeatPorcent = 2
        end
    end
    if songName == 'cycles' then
        if curStep == 128 or curStep == 320 or curStep == 1392 or curStep == 1424 then
            BeatPorcent = 2
        end
        if curStep == 832 or curStep == 1232 then
            BeatPorcent = 1
        end
        if curStep == 256 or curStep == 1088 or curStep == 1376 or curStep == 1408 or curStep == 1488 then
            BeatPorcent = 0
        end
    end
    if songName == 'triple-trouble' then
        if curStep == 80 or curStep == 144 or curStep == 528 or curStep == 1104 or curStep == 1680 or curStep == 1936 or curStep == 2896 or curStep == 3216 or curStep == 4048 then
            BeatPorcent = 2
        end
        if curStep == 28 or curStep == 496 or curStep == 912 or curStep == 1136 or curStep == 1920 or curStep == 2927 or curStep == 2960 or curStep == 3728 or curStep == 4080 then
            BeatPorcent = 1
        end
        if curStep == 520 or curStep == 1030 or curStep == 1159 or curStep == 2312 or curStep == 2952 or curStep == 3975 or curStep == 5128 then
            BeatPorcent = 0
        end
    end

    if songName == 'endless' then
        if curStep == 7 then
            BeatPorcent = 1
        end
    end
    if songName == 'endless-encore' then
        if curStep == 7 or curStep == 1328 then
            BeatPorcent = 1
        end
        if curStep == 1584 then
            BeatPorcent = 2
        end
        if curStep == 1312 or curStep == 1616 then
            BeatPorcent = 0
        end
    end
    
    if songName == 'milk' then
        if curStep == 96 or curStep == 144 then
            BeatPorcent = 1
        end
        if curStep == 119 or curStep == 1694 then
            BeatPorcent = 0
        end
    end
    if songName == 'milk-old' then
        if curStep == 0 then
            BeatPorcent = 2
        end
        if curStep == 48 or curStep == 2273 then
            BeatPorcent = 0
        end
        if curStep == 96 then
            BeatPorcent = 1
        end
    end

    if songName == 'Prey' then
        if curStep == 384 or curStep == 1024 or curStep == 2560 then
            BeatPorcent = 2
            BeatStyle = 1
            BeatValue = -1
            BeatStrentghGame = 0.015
            BeatStrentghHUD = 0.03
        end
        if curStep == 512 or curStep == 1536 or curStep == 2328 or curStep == 3072 then
            BeatPorcent = 1
            BeatStyle = 0
            BeatValue = 0
            BeatStrentghGame = 0.025
            BeatStrentghHUD = 0.04
        end
        if curStep == 2304 or curStep == 3328 then
            BeatPorcent = 0
        end
    end
    if songName == 'Fight or Flight' then
        if curStep == 384 or curStep == 1312 then
            BeatPorcent = 2
        end
        if curStep == 640 or curStep == 1184 or curStep == 1472 then
            BeatPorcent = 1
        end
        if curStep == 1152 or curStep == 1296 or curStep == 1440 or curStep == 1952 then
            BeatPorcent = 0
        end
    end
    if songName == 'soulless-orycover' then
        if curStep == 272 then
            BeatPorcent = 1
        end
        if curStep == 1552 then
            BeatPorcent = 0
        end
    end
    if songName == 'soulless-nikocover' then
        if curStep == 272 or curStep == 672 then
            BeatPorcent = 2
        end
        if curStep == 400 or curStep == 1312 then
            BeatPorcent = 1
        end
        if curStep == 656 or curStep == 1184 or curStep == 1952 then
            BeatPorcent = 0
        end
    end
end
