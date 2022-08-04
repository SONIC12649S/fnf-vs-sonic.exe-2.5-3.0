local bfx = 80;
local bfy = 80;
local zoomshit = 0;
function onCreatePost()
    for strumLineNotes = 0,7 do
        if strumLineNotes < 4 then
           setPropertyFromGroup('strumLineNotes',strumLineNotes,'visible',false)
        elseif strumLineNotes >= 4 then
             setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',446 + (112 * (strumLineNotes - 4)))
             setPropertyFromGroup('strumLineNotes',strumLineNotes,'alpha',0.5)
        end
    end
end
function onUpdatePost()
    for strumLineNotes = 4,7 do
        setPropertyFromGroup('strumLineNotes',strumLineNotes,'x',446 + (112 * (strumLineNotes - 4)))
        setPropertyFromGroup('strumLineNotes',strumLineNotes,'alpha',0.5)
    end
    for notesLength = 0,getProperty('notes.length') do
        if getPropertyFromGroup('notes', notesLength,'mustPress') == false then
            setPropertyFromGroup('notes',notesLength,'visible',false)
        else
 
            if getPropertyFromGroup('notes',notesLength,'isSustainNote') == false then
                setPropertyFromGroup('notes',notesLength,'alpha',1)
            else
                setPropertyFromGroup('notes',notesLength,'alpha',0.55)
            end
        end
    end
end
function onUpdate()
    setTextString('scoreTxt','Sacrifices: '..getProperty('songMisses') ..' | Accuracy: '..(string.sub(getProperty('ratingPercent')* 100,0,5)).. '% ['..getProperty('ratingFC')..']')
    if mustHitSection == false then
        setProperty('defaultCamZoom', 1)
    elseif mustHitSection == true then
        setProperty('defaultCamZoom', 0.9)
    end
    zoomshit = getProperty('camGame.zoom')/0.6;
    setProperty('boyfriend.x',bfx*zoomshit)
    setProperty('boyfriend.y',bfy*zoomshit)
    setProperty('boyfriend.scale.x',zoomshit)
    setProperty('boyfriend.scale.y',zoomshit)
end