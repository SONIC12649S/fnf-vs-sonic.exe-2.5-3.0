function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title",  "Friday Night Funkin': Psych Engine - Loading, please wait...")
end
function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine - In The Menus")
end

function onCreatePost()
	if songName == 'you-cant-run' then
	setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine - You Can't Run - Saster & MarStarBro [Encore]")
	end
end