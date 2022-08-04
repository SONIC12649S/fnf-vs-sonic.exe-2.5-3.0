function onCreate()
	makeLuaSprite('jumps', 'simplejump', -125, -50);
	setScrollFactor('jumps', 0, 0);
	setObjectCamera('jumps', 'other');
	scaleObject('jumps',0.8,0.8)
	addLuaSprite('jumps',true)
	setProperty('jumps.alpha', 0)
	
	subStuff = getProperty('health');     
	healthSet = 0.1;
	
	makeLuaSprite('foundyou', 'Angel-Island/caught', 0, 0);
	scaleObject('foundyou', 0.67, 0.67);
	setScrollFactor('foundyou', 0, 0);
	setProperty('foundyou.alpha', 0)
	addLuaSprite('foundyou', true);
	setObjectCamera('foundyou', 'other');
end

function onCreatePost()
	setObjectOrder('foundyou', getObjectOrder('creep') - 1)
	setObjectOrder('jumps', getObjectOrder('creep') - 1)
end

function onEvent(name, value1, value2)
    if name == "Sonic Face" then

		if value2 == "foundyou" then
			setProperty('foundyou.alpha', 1)
			runTimer('foundyou', value1);
		end
		if value2 == "sonic" then
			playSound('sppok', 0.4)
			setProperty('jumps.alpha', 1)
			runTimer('jummpu', value1);
		end

	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'jummpu' then
		setProperty('jumps.alpha', 0)
	end
	if tag == 'foundyou' then
		setProperty('foundyou.alpha', 0)
	end
end