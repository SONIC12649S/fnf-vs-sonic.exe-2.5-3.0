local bgSpeed = 50

local state = 0
function onCreate()
	for starvedBg = 0,2 do
		makeLuaSprite('StarvedBG'..starvedBg,'starved/stardustBg',-600 + (4608 * starvedBg),-1100)
		addLuaSprite('StarvedBG'..starvedBg)
		makeLuaSprite('StarvedGround'..starvedBg,'starved/stardustFloor',-600 + (4608 * starvedBg),-1465)
		addLuaSprite('StarvedGround'..starvedBg,true)
		if songName == 'Prey' and curBeat < 32 then
			setProperty('StarvedBG'..starvedBg..'.visible',false)
			setProperty('StarvedGround'..starvedBg..'.visible',false)
		end
	end
	if songName == 'Prey' then
		makeLuaSprite('wowWhite','',0,0)
		setObjectCamera('wowWhite','other')
		makeGraphic('wowWhite',screenWidth,screenHeight,'FFFFFF')
	end
end

function onUpdate()
	if curBeat < 32 and songName == 'Prey' then
		setProperty('boyfriend.alpha',0.25 * state)
		setProperty('camHUD.alpha',0)
	end
	if getProperty('boyfriend.curCharacter') == 'bf-Sonic-Peelout' then
		bgSpeed = 80
	end
	for bgCount = 0,2 do
		setProperty('StarvedBG'..bgCount..'.x',getProperty('StarvedBG'..bgCount..'.x') - (bgSpeed/2))
		setProperty('StarvedGround'..bgCount..'.x',getProperty('StarvedGround'..bgCount..'.x') - bgSpeed)
	end
	if getProperty('StarvedBG1.x') < -600 - getProperty('StarvedBG1.width') then
		for backPosition = 0,2 do
			setProperty('StarvedBG'..backPosition..'.x',-600 + (getProperty('StarvedBG'..backPosition..'.width') * backPosition))
		end
	end
	if getProperty('StarvedGround1.x') < -600 - getProperty('StarvedGround1.width')then
		for backGroundPosition = 0,2 do
			setProperty('StarvedGround'..backGroundPosition..'.x',-600 + (getProperty('StarvedGround'..backGroundPosition..'.width') * backGroundPosition))
		end
	end
end
function onBeatHit()
	if curBeat % 8 == 0 and songName == 'Prey' then
		if curBeat < 32 then

			state = state + 1
			triggerEvent('Add Camera Zoom','','0')
		end
		if curBeat == 32 then
			setProperty('boyfriend.alpha',1)
			addLuaSprite('wowWhite',true)
			doTweenAlpha('wowByeWhite','wowWhite',0,1,'linear')
			for starvedBg = 0,2 do
				setProperty('StarvedBG'..starvedBg..'.visible',true)
				setProperty('StarvedGround'..starvedBg..'.visible',true)
			end
		end
	end
end
function onStepHit()
	if curStep == 250 and songName == 'Prey' then
		doTweenAlpha('backCamHUD','camHUD',1,0.5,'quartOut')
	end
end
function onTweenCompleted(tag)
	if tag == 'wowByeWhite' then
		removeLuaSprite('wowWhite',true)
	end
end