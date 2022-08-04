function onCreate()
	--gus
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--pog properties
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pixel Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PIXEL_NOTE_assets');
		end
	end
end