function onCreate()

        makeLuaSprite('ScorchedBG', 'ScorchedBG', -600, -300);
	setScrollFactor('ScorchedBG', 1, 1);

        makeLuaSprite('HogNotAnimatedBg', 'HogNotAnimatedBg', -600, -300);
	setScrollFactor('HogNotAnimatedBg', 0.9, 0.9);
 
        addLuaSprite('ScorchedBG', false);
	addLuaSprite('HogNotAnimatedBg', false);

        setProperty('ScorchedBG.visible', true);
        setProperty('HogNotAnimatedBg.visible', true);
end
