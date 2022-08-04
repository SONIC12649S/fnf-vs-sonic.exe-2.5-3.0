function onCreate()
	makeLuaSprite('sunkyBg','sunky/sunky BG',-1000,-800)
	scaleObject('sunkyBg',1.3,1.3)

	makeLuaSprite('sunkyball','sunky/ball',200,-500)

	makeLuaSprite('sunkyGround','sunky/stage',-200,-800)
	scaleObject('sunkyGround',1.3,1.3)


	addLuaSprite('sunkyBg',false)
	addLuaSprite('sunkyball',true)
	addLuaSprite('sunkyGround',false)
end