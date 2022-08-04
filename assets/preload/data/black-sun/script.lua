function onCreatePost()
    for strumLineNotes = 0,3 do
        setPropertyFromGroup('strumLineNotes',strumLineNotes,'visible',false)
    end
end
function onUpdate()
    for notesLength = 0,getProperty('notes.length') do
        if getPropertyFromGroup('notes', notesLength,'mustPress') == false then
            setPropertyFromGroup('notes',notesLength,'visible',false)
        end
    end
end