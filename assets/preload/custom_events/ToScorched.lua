-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'ToScorched ' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
        setProperty('ScorchedBG', targetAlpha);

		else
			doTweenAlpha('ScorchedBGFadeEventTween', 'ScorchedBG', targetAlpha, duration, 'linear');
		end
		-- ñ
	end
end