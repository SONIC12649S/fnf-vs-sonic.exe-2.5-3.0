function onCreate()
	makeLuaSprite('StarvedLight','starved/light',-400,-300)
	scaleObject('StarvedLight',1.45,1.45)
	addLuaSprite('StarvedLight')

	makeLuaSprite('StarvedCity','starved/city',-380,-300)
	scaleObject('StarvedCity',1.45,1.45)
	addLuaSprite('StarvedCity')
	setScrollFactor('StarvedCity',0.7,0.7)

	makeLuaSprite('StarvedTowers','starved/towers',-380,-300)
	scaleObject('StarvedTowers',1.45,1.45)
	addLuaSprite('StarvedTowers')
	setScrollFactor('StarvedTowers',0.8,0.8)

	makeLuaSprite('StarvedWall','starved/stage',-400,-300)
	scaleObject('StarvedWall',1.45,1.45)
	addLuaSprite('StarvedWall')

	makeLuaSprite('StarvedSonicDead','starved/sonicisfuckingdead',120,50)
	scaleObject('StarvedSonicDead',0.65,0.65)
	addLuaSprite('StarvedSonicDead')
end
function onStepHit()
	if curStep == 1184 or curStep == 1472 then
		doTweenAlpha('ByeLight','StarvedLight',0,1,'linear')
		doTweenAlpha('ByeCity','StarvedCity',0,1,'linear')
		doTweenAlpha('ByeTowers','StarvedTowers',0,1,'linear')
		doTweenAlpha('ByeWall','StarvedWall',0,1,'linear')
		doTweenColor('boyfriendColor','boyfriend','FF0000',1,'linear')
		doTweenColor('dadColor','dad','FF0000',1,'linear')
		doTweenColor('sonicColor','StarvedSonicDead','FF0000',1,'linear')
	end
	if curStep == 1440 or curStep == 1728 then
		doTweenAlpha('ByeLight','StarvedLight',1,1,'linear')
		doTweenAlpha('ByeCity','StarvedCity',1,1,'linear')
		doTweenAlpha('ByeTowers','StarvedTowers',1,1,'linear')
		doTweenAlpha('ByeWall','StarvedWall',1,1,'linear')
		doTweenColor('boyfriendColor','boyfriend','FFFFFF',1,'linear')
		doTweenColor('dadColor','dad','FFFFFF',1,'linear')
		doTweenColor('sonicColor','StarvedSonicDead','FFFFFF',1,'linear')
	end
end