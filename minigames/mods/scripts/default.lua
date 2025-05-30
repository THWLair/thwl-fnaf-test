function onCreate()
	
	initSaveData('thwlTests')
	luaDebugMode = true
	luaDeprecatedWarnings = true
	setPropertyFromClass('flixel.addons.transition.FlxTransitionableState', 'skipNextTransIn', true)
	setPropertyFromClass('flixel.addons.transition.FlxTransitionableState', 'skipNextTransOut', true)
	setProperty('skipCountdown', true)
	setProperty('canReset', false)
	setProperty('isCameraOnForcedPos', true)
	setProperty('skipCountdown', true)
	setProperty('camZooming', false)
	setPropertyFromClass('flixel.FlxG', 'autoPause', false)
	setProperty('camZoomingMult', 0)

end



function onCreatePost()

hudStuff = {'scoreTxt', 'timeTxt', 'timeBar', 'timeBarBG', 'healthBarOverlay'}

	for i = 1, 5 do setProperty(hudStuff[i] ..'.visible', false) end
	setProperty('healthBar.alpha', 0); setProperty('iconP1.alpha', 0); setProperty('iconP2.alpha', 0);

end



function onUpdate()
	changeDiscordClientID('1376276041013919806')

	if keyboardJustPressed('P') then
		loadSong('begin')
	end

	if keyboardJustPressed('R') then
		restartSong()
	end
end



function onEndSong()
	return Function_Stop
end

function onGameOver()
	return Function_Stop
end

function onPause()
	return Function_Stop
end