function onCreate()
	makeLuaText('Watermarc', "PORT BY SONIC12649S ", 0, 2, 700); 
	setTextSize('Watermarc', 20);
	setObjectCamera('Watermarc', 'other');
	addLuaText('Watermarc', true);

local bfVisible = 0
function onUpdate()

    if bfVisible == 0 then
        setProperty('boyfriend.visible',false)
        bfVisible = 2
    end
end
