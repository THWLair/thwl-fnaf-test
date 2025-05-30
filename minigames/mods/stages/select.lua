function onCreate()

	setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)

	starting = false
	canTouch = true

	precacheMusic('music')
	runTimer('music', 0.1)

	cameraFlash('other', '000000', 2)

	makeLuaSprite('square', '')
	makeGraphic('square', 1280, 720, '171111')
	setObjectCamera('square', 'other')
	addLuaSprite('square')

	makeLuaSprite('dark', 'hailey/dark')
    setObjectCamera('dark', 'other')
    addLuaSprite('dark', true)

	makeLuaText('th2l', "T H 2 L", 0, 150, 130)
	setTextSize('th2l', 25)
	setTextBorder('th2l', 0)
	setProperty('th2l.alpha', 0.5)
	setObjectCamera('th2l', 'other')
	setTextFont('th2l', 'ROCC.TTF')
    setProperty('th2l.antialiasing', true)
	addLuaText('th2l')

	makeLuaText('title', "Hailey's Fate", 0, 150, 160)
	setTextSize('title', 45)
	setTextBorder('title', 0)
	setObjectCamera('title', 'other')
	setTextFont('title', 'ROCK.TTF')
    setProperty('title.antialiasing', true)
	addLuaText('title')

	makeLuaText('desc', 'A simple prototype fnaf fangame', 0, 150, 220)
	setTextSize('desc', 16)
	setTextBorder('desc', 0)
	setProperty('desc.alpha', 0.2)
	setObjectCamera('desc', 'other')
	setTextFont('desc', 'ROCK.TTF')
    setProperty('desc.antialiasing', true)
	addLuaText('desc')

	makeLuaText('nights', '- NIGHT SELECT -', 0, 200, 270)
	setTextSize('nights', 18)
	setTextBorder('nights', 0)
	setProperty('nights.alpha', 0.3)
	setTextFont('nights', 'ROCC.TTF')
    setProperty('nights.antialiasing', true)
	setObjectCamera('nights', 'other')
	addLuaText('nights')

	makeLuaText('night1', 'Night 1', 0, 200, 300)
	setTextSize('night1', 20)
	setTextBorder('night1', 0)
	setProperty('night1.alpha', 0.6)
	setTextFont('night1', 'ROCK.TTF')
    setProperty('night1.antialiasing', true)
	setObjectCamera('night1', 'other')
	addLuaText('night1')

	makeLuaSprite('n1', '', 200, 290)
	makeGraphic('n1', 180, 40, '222222')
	setObjectCamera('n1', 'other')

	makeLuaText('night2', 'Night 2', 0, 200, 350)
	setTextSize('night2', 20)
	setTextBorder('night2', 0)
	setProperty('night2.alpha', 0.6)
	setTextFont('night2', 'ROCK.TTF')
    setProperty('night2.antialiasing', true)
	setObjectCamera('night2', 'other')
	addLuaText('night2')

	makeLuaSprite('n2', '', 200, 340)
	makeGraphic('n2', 180, 40, '222222')
	setObjectCamera('n2', 'other')

	makeLuaText('night3', 'Night 3', 0, 200, 400)
	setTextSize('night3', 20)
	setTextBorder('night3', 0)
	setProperty('night3.alpha', 0.6)
	setTextFont('night3', 'ROCK.TTF')
    setProperty('night3.antialiasing', true)
	setObjectCamera('night3', 'other')
	addLuaText('night3')

	makeLuaSprite('n3', '', 200, 390)
	makeGraphic('n3', 180, 40, '222222')
	setObjectCamera('n3', 'other')

	makeLuaText('night4', 'Night 4', 0, 200, 450)
	setTextSize('night4', 20)
	setTextBorder('night4', 0)
	setProperty('night4.alpha', 0.6)
	setTextFont('night4', 'ROCK.TTF')
    setProperty('night4.antialiasing', true)
	setObjectCamera('night4', 'other')
	addLuaText('night4')

	makeLuaSprite('n4', '', 200, 440)
	makeGraphic('n4', 180, 40, '222222')
	setObjectCamera('n4', 'other')

	makeLuaText('night5', 'Night 5', 0, 200, 500)
	setTextSize('night5', 20)
	setTextBorder('night5', 0)
	setProperty('night5.alpha', 0.6)
	setTextFont('night5', 'ROCK.TTF')
    setProperty('night5.antialiasing', true)
	setTextColor('night5', 'FF9999')
	setObjectCamera('night5', 'other')
	addLuaText('night5')

	makeLuaSprite('n5', '', 200, 490)
	makeGraphic('n5', 180, 40, '222222')
	setObjectCamera('n5', 'other')

	makeLuaText('custom', 'Custom Night', 150, 900, 450)
	setTextSize('custom', 20)
	setTextBorder('custom', 0)
	setProperty('custom.alpha', 0.6)
	setTextFont('custom', 'ROCK.TTF')
	setTextAlignment('custom', 'right')
    setProperty('custom.antialiasing', true)
	setObjectCamera('custom', 'other')
	addLuaText('custom')

	makeLuaSprite('c', '', 900, 445)
	makeGraphic('c', 150, 40, '222222')
	setObjectCamera('c', 'other')

	makeLuaText('quit', 'Quit', 150, 900, 500)
	setTextSize('quit', 20)
	setTextBorder('quit', 0)
	setProperty('quit.alpha', 0.6)
	setTextFont('quit', 'ROCK.TTF')
	setTextAlignment('quit', 'right')
    setProperty('quit.antialiasing', true)
	setObjectCamera('quit', 'other')
	addLuaText('quit')

	makeLuaSprite('q', '', 900, 495)
	makeGraphic('q', 150, 40, '222222')
	setObjectCamera('q', 'other')

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

	setProperty('rpg.alpha', 0.5)
	setProperty('cash.alpha', 0.5)
	setProperty('hunter.alpha', 0.5)
end

function onUpdate()

	setProperty('static.flipY', getRandomBool(50))
    setProperty('static.flipX', getRandomBool(50))

	setProperty('square.alpha', getRandomFloat(0.6, 3))

	setProperty('cursor.x', getMouseX('other'))
	setProperty('cursor.y', getMouseY('other'))


	if mouseOverlaps('n1', 'camOther') and not starting then

		if getProperty('night1.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night1.alpha', 1)
			setTextString('night1', "Monday's Harvest <")
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 1)
			onStartNight()
		end
	else
		setTextString('night1', "Monday's Harvest")
		setProperty('night1.alpha', 0.6)
	end




	if mouseOverlaps('n2', 'camOther') and not starting then

		if getProperty('night2.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night2.alpha', 1)
			setTextString('night2', "Tuesday's Harvest <")
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 2)
			onStartNight()
		end
	else
		setTextString('night2', "Tuesday's Harvest")
		setProperty('night2.alpha', 0.6)
	end



	if mouseOverlaps('n3', 'camOther') and not starting then

		if getProperty('night3.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night3.alpha', 1)
			setTextString('night3', "Wednesday's Harvest <")
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 3)
			onStartNight()
		end
	else
		setTextString('night3', "Wednesday's Harvest")
		setProperty('night3.alpha', 0.6)
	end





	if mouseOverlaps('n4', 'camOther') and not starting then

		if getProperty('night4.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night4.alpha', 1)
			setTextString('night4', "Thursday's Harvest <")
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 4)
			onStartNight()
		end
	else
		setTextString('night4', "Thursday's Harvest")
		setProperty('night4.alpha', 0.6)
	end



	if mouseOverlaps('n5', 'camOther') and not starting then

		if getProperty('night5.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night5.alpha', 1)
			setTextString('night5', "Friday's Harvest <")
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 5)
			onStartNight()
		end
	else
		setTextString('night5', "Friday's Harvest")
		setProperty('night5.alpha', 0.6)
	end



	if mouseOverlaps('c', 'camOther') and not starting then
		setTextString('custom', "Custom Harvest")
		setProperty('custom.alpha', 0.6)
	end




	if mouseOverlaps('q', 'camOther') and not starting then

		if getProperty('quit.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('quit.alpha', 1)
			setTextString('quit', '> Quit')
		end

		if mouseClicked('left') then
			os.exit()
		end
	else
		setTextString('quit', 'Quit')
		setProperty('quit.alpha', 0.6)
	end








	if mouseOverlaps('cash', 'camOther') then

		if getProperty('cash.alpha') ~= 1 then
			playSound('scrollMenu')
			setProperty('cash.alpha', 1)
		end

		if mouseClicked('left') then
			loadSong('cash')
		end
	else
		setProperty('cash.alpha', 0.5)
	end



	if mouseOverlaps('hunter', 'camOther') then

		if getProperty('hunter.alpha') ~= 1 then
			playSound('scrollMenu')
			setProperty('hunter.alpha', 1)
		end

		if mouseClicked('left') then
			loadSong('office')
		end
	else
		setProperty('hunter.alpha', 0.5)
	end



	if curStep == 146 then
		callMethod('setSongTime', {1 * 1000})
	end
end







function onTimerCompleted(tag)

	if tag == 'canTouch' then
		canTouch = true
	end
	if tag == 'music' then
		playMusic('music', 1, true)
	end

	if tag == 'startsong' then
		loadSong('office')
	end
end


function onStartNight()
	starting = true
	soundFadeOut(_, 3, 0)
	makeLuaSprite('black', '')
	makeGraphic('black', 1280, 720, '000000')
	setObjectCamera('black', 'other')
	addLuaSprite('black', true)
	setProperty('black.alpha', 0)
	doTweenAlpha('black', 'black', 1, 3.5)

	makeLuaText('starting', "N I G H T  "..getDataFromSave('thwlTests', 'night'), 1280)
	setTextSize('starting', 32)
	setTextBorder('starting', 0)
	setObjectCamera('starting', 'other')
	setTextFont('starting', 'ROCC.TTF')
    setProperty('starting.antialiasing', true)
	addLuaText('starting', true)
	screenCenter('starting', 'y')
	setProperty('starting.alpha', 0)
	setProperty('starting.scale.x', 1.1)
	doTweenAlpha('starting', 'starting', 1, 0.5, 'bounceOut')

	runTimer('startsong', 4)
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