function onCreate()
	-- background shit
	
	makeAnimatedLuaSprite('cieloburn', 'cieloburn', -600, -720);
	addAnimationByPrefix('cieloburn', 'cieloburn', 'cieloburn', 30, true);
	objectPlayAnimation('cieloburn', 'cieloburn', true);
	setScrollFactor('cieloburn', 0.9, 0.9);
	scaleObject('cieloburn', 2.9, 2.9);
	
	makeLuaSprite('suelob','suelob',-700, -100)
	scaleObject('suelob', 1.3, 0.9);
	setScrollFactor('suelob', 0.9, 0.9);

	makeLuaSprite('greenhillfake', 'greenhillfake', -600, -300);
	setScrollFactor('greenhillfake', 0.9, 0.9);

	makeLuaSprite('transparente', 'transparente', -600, -300);
	setScrollFactor('transparente', 0.9, 0.9);

	addLuaSprite('transparente', false);	
	addLuaSprite('cieloburn', false);	
	addLuaSprite('suelob', false);
	addLuaSprite('greenhillfake', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end