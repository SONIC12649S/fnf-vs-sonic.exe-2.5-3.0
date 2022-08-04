local bfVisible = 0
function onUpdate()

    if bfVisible == 0 then
        setProperty('boyfriend.visible',false)
        bfVisible = 2
    end
end