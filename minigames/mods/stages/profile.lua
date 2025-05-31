function onCreate()

	name = ''
	canType = true

	makeLuaText('title', "Please enter your name below", 1280, 0, 300)
	setTextSize('title', 25)
	setTextBorder('title', 0)
	setProperty('title.alpha', 0.5)
	setObjectCamera('title', 'other')
	setTextFont('title', 'ROCC.TTF')
    setProperty('title.antialiasing', true)
	addLuaText('title')

	makeLuaText('user', "______", 1280, 0, 350)
	setTextSize('user', 40)
	setTextBorder('user', 0)
	setObjectCamera('user', 'other')
	setTextFont('user', 'ROCK.TTF')
    setProperty('user.antialiasing', true)
	addLuaText('user')

	makeLuaText('fact', "Next time you log in, enter the same name to recover your progress.", 1280, 0, 415)
	setTextSize('fact', 25)
	setTextBorder('fact', 0)
	setProperty('fact.alpha', 0.5)
	setObjectCamera('fact', 'other')
	setTextFont('fact', 'ROCC.TTF')
    setProperty('fact.antialiasing', true)
	addLuaText('fact')

	makeLuaText('thing', "", 1280, 0, 0)
	setTextSize('thing', 16)
	setTextBorder('thing', 0)
	setProperty('thing.alpha', 0.2)
	setObjectCamera('thing', 'other')
	setTextFont('thing', 'ROCC.TTF')
    setProperty('thing.antialiasing', true)
	addLuaText('thing')

	makeLuaText('done', "Done", 1280, 0, 560)
	setTextSize('done', 40)
	setTextBorder('done', 0)
	setObjectCamera('done', 'other')
	setTextFont('done', 'ROCC.TTF')
    setProperty('done.antialiasing', true)
	addLuaText('done')
	setProperty('done.alpha', 0.1)

	makeLuaSprite('static', 'hailey/static', 0, 0)
	setBlendMode('static', 'multiply')
	setObjectCamera('static', 'other')
	addLuaSprite('static', true)
	setProperty('static.alpha', 0.5)

	makeLuaText('cursor', '°')
	setTextSize('cursor', 30)
	setTextBorder('cursor', 0)
	setTextFont('cursor', 'ROCC.TTF')
    setProperty('cursor.antialiasing', true)
	setObjectCamera('cursor', 'other')
	addLuaText('cursor')

end




function onUpdate()

	pressingKey = callMethodFromClass('backend.InputFormatter', 'getKeyName', {callMethodFromClass('flixel.FlxG', 'keys.firstJustPressed', {''})})

	setTextString('thing', pressingKey)

	setProperty('static.flipY', getRandomBool(50))
    setProperty('static.flipX', getRandomBool(50))

	setProperty('cursor.x', getMouseX('other'))
	setProperty('cursor.y', getMouseY('other'))

	if pressingKey ~= '---' and pressingKey ~= 'BckSpc' and pressingKey ~= 'Space' and pressingKey ~= 'Ctrl' and pressingKey ~= 'Shift' then

		if not keyboardPressed('SHIFT') then
			name = name..''..string.lower(pressingKey)
		else
			name = name..''..pressingKey
		end
	end


	if name ~= '' then
		if pressingKey == 'Space' then
			name = name..' '
		end
		setProperty('done.alpha', 1)
		setTextString('user', name)
	end



	if keyboardJustPressed('F11') then

        if getPropertyFromClass('openfl.Lib', 'application.window.fullscreen') then
            setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
        else
            setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
        end
    end

    if keyboardJustPressed('BACKSPACE') then
		restartSong()
	end


	if mouseOverlaps('done', 'camOther') and mouseClicked('left') and name ~= '' then
		setDataFromSave('thwlTests', 'username', name)

		if not getDataFromSave('thwlTests', name) then
		setDataFromSave('thwlTests', name, true)
		setDataFromSave('thwlTests', name..'-night1', 0)
		setDataFromSave('thwlTests', name..'-night2', 0)
		setDataFromSave('thwlTests', name..'-night3', 0)
		setDataFromSave('thwlTests', name..'-night4', 0)
		setDataFromSave('thwlTests', name..'-night5', 0)
		setDataFromSave('thwlTests', name..'-night6', 0)
		setDataFromSave('thwlTests', name..'-pfp', 1)
		setDataFromSave('thwlTests', name..'-money', 0)
		setDataFromSave('thwlTests', name..'-extra', 0)
		end
		loadSong('menu')
	end

end


function mouseOverlaps(obj, camera)
    mX = getMouseX(camera)
    mY = getMouseY(camera)
    x = getProperty(obj..'.x')
    y = getProperty(obj..'.y')
    width = getProperty(obj..'.width')
    height = getProperty(obj..'.height')
    return (mX > x) and (mX < x + width) and (mY > y) and (mY < y + height)
end