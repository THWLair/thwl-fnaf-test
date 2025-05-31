function onCreate()

	setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)

	starting = false
	canTouch = true
	menu = ''
	fish = 2
	music = 2
	door = 2
	camera = 2
	name = getDataFromSave('thwlTests', 'username')

	precacheMusic('music')
	runTimer('music', 0.1)

	cameraFlash('other', '000000', 1)

	makeLuaSprite('square', 'hailey/menu')
	setObjectCamera('square', 'hud')
	addLuaSprite('square')

	makeLuaSprite('dark', 'hailey/dark')
    setObjectCamera('dark', 'hud')
    addLuaSprite('dark', true)

	makeLuaText('th2l', "T H 2 L", 0, 150 - 50, 130)
	setTextSize('th2l', 25)
	setTextBorder('th2l', 0)
	setProperty('th2l.alpha', 0.5)
	setObjectCamera('th2l', 'other')
	setTextFont('th2l', 'ROCC.TTF')
    setProperty('th2l.antialiasing', true)
	addLuaText('th2l')
	doTweenX('th2l', 'th2l', 150, 3, 'expoOut')

	makeLuaText('title', "Hailey's Fate", 0, 150 - 50, 160)
	setTextSize('title', 45)
	setTextBorder('title', 0)
	setObjectCamera('title', 'other')
	setTextFont('title', 'ROCK.TTF')
    setProperty('title.antialiasing', true)
	addLuaText('title')
	doTweenX('title', 'title', 150, 2, 'expoOut')

	makeLuaText('desc', 'A simple prototype fnaf fangame', 0, 150 - 50, 220)
	setTextSize('desc', 16)
	setTextBorder('desc', 0)
	setProperty('desc.alpha', 0.2)
	setObjectCamera('desc', 'other')
	setTextFont('desc', 'ROCK.TTF')
    setProperty('desc.antialiasing', true)
	addLuaText('desc')
	doTweenX('desc', 'desc', 150, 1, 'expoOut')

	makeLuaText('name', 'Logged as '..name, 0, 200 - 30, 630)
	setTextSize('name', 16)
	setTextBorder('name', 0)
	setProperty('name.alpha', 0.3)
	setTextFont('name', 'ROCK.TTF')
    setProperty('name.antialiasing', true)
	setObjectCamera('name', 'other')
	addLuaText('name')
	doTweenX('name', 'name', 200, 2, 'expoOut')

	makeLuaText('profile', 'Profile', 150, 200 - 30, 600)
	setTextSize('profile', 20)
	setTextBorder('profile', 0)
	setProperty('profile.alpha', 0.6)
	setTextFont('profile', 'ROCK.TTF')
	setTextAlignment('profile', 'left')
    setProperty('profile.antialiasing', true)
	setObjectCamera('profile', 'other')
	addLuaText('profile')
	doTweenX('profile', 'profile', 200, 2, 'expoOut')

	makeLuaSprite('p', '', 200, 595)
	makeGraphic('p', 150, 40, '222222')
	setObjectCamera('p', 'other')

	makeLuaText('nights', '- NIGHT SELECT -', 0, 200, 270 - 30)
	setTextSize('nights', 18)
	setTextBorder('nights', 0)
	setProperty('nights.alpha', 0.3)
	setTextFont('nights', 'ROCC.TTF')
    setProperty('nights.antialiasing', true)
	setObjectCamera('nights', 'other')
	addLuaText('nights')
	doTweenY('nights', 'nights', 270, 2, 'expoOut')

	makeLuaText('night1', 'Night 1', 0, 200, 300 - 30)
	setTextSize('night1', 20)
	setTextBorder('night1', 0)
	setProperty('night1.alpha', 0.6)
	setTextFont('night1', 'ROCK.TTF')
    setProperty('night1.antialiasing', true)
	setObjectCamera('night1', 'other')
	addLuaText('night1')
	doTweenY('night1', 'night1', 300, 2, 'expoOut')

	makeLuaSprite('n1', '', 200, 290)
	makeGraphic('n1', 180, 40, '222222')
	setObjectCamera('n1', 'other')

	if getDataFromSave('thwlTests', name..'-night1') == 1 then

	makeLuaText('night2', 'Night 2', 0, 200, 350 - 30)
	setTextSize('night2', 20)
	setTextBorder('night2', 0)
	setProperty('night2.alpha', 0.6)
	setTextFont('night2', 'ROCK.TTF')
    setProperty('night2.antialiasing', true)
	setObjectCamera('night2', 'other')
	addLuaText('night2')
	doTweenY('night2', 'night2', 350, 2, 'expoOut')

	makeLuaSprite('n2', '', 200, 340)
	makeGraphic('n2', 180, 40, '222222')
	setObjectCamera('n2', 'other')

	end


	if getDataFromSave('thwlTests', name..'-night2') == 1 then

	makeLuaText('night3', 'Night 3', 0, 200, 400 - 30)
	setTextSize('night3', 20)
	setTextBorder('night3', 0)
	setProperty('night3.alpha', 0.6)
	setTextFont('night3', 'ROCK.TTF')
    setProperty('night3.antialiasing', true)
	setObjectCamera('night3', 'other')
	addLuaText('night3')
	doTweenY('night3', 'night3', 400, 2, 'expoOut')

	makeLuaSprite('n3', '', 200, 390)
	makeGraphic('n3', 180, 40, '222222')
	setObjectCamera('n3', 'other')

	end

	if getDataFromSave('thwlTests', name..'-night3') == 1 then

	makeLuaText('night4', 'Night 4', 0, 200, 450 - 30)
	setTextSize('night4', 20)
	setTextBorder('night4', 0)
	setProperty('night4.alpha', 0.6)
	setTextFont('night4', 'ROCK.TTF')
    setProperty('night4.antialiasing', true)
	setObjectCamera('night4', 'other')
	addLuaText('night4')
	doTweenY('night4', 'night4', 450, 2, 'expoOut')

	makeLuaSprite('n4', '', 200, 440)
	makeGraphic('n4', 180, 40, '222222')
	setObjectCamera('n4', 'other')

	end

	if getDataFromSave('thwlTests', name..'-night4') == 1 then

	makeLuaText('night5', 'Night 5', 0, 200, 500 - 30)
	setTextSize('night5', 20)
	setTextBorder('night5', 0)
	setProperty('night5.alpha', 0.6)
	setTextFont('night5', 'ROCK.TTF')
    setProperty('night5.antialiasing', true)
	setTextColor('night5', 'FF9999')
	setObjectCamera('night5', 'other')
	addLuaText('night5')
	doTweenY('night5', 'night5', 500, 2, 'expoOut')

	makeLuaSprite('n5', '', 200, 490)
	makeGraphic('n5', 180, 40, '222222')
	setObjectCamera('n5', 'other')

	end

	if getDataFromSave('thwlTests', name..'-night5') == 1 then

	makeLuaText('survival', 'Endless Survival', 190, 900 - 40, 300 - 30)
	setTextSize('survival', 20)
	setTextBorder('survival', 0)
	setProperty('survival.alpha', 0.1)
	setTextFont('survival', 'ROCK.TTF')
	setTextAlignment('survival', 'right')
	setTextColor('survival', 'DDFFDD')
    setProperty('survival.antialiasing', true)
	setObjectCamera('survival', 'other')
	addLuaText('survival')
	doTweenY('survival', 'survival', 300, 2, 'expoOut')

	makeLuaSprite('es', '', 900, 295)
	makeGraphic('es', 150, 40, '222222')
	setObjectCamera('es', 'other')

	makeLuaText('custom', 'Custom Harvest', 170, 900, 350 - 30)
	setTextSize('custom', 20)
	setTextBorder('custom', 0)
	setProperty('custom.alpha', 0.6)
	setTextFont('custom', 'ROCK.TTF')
	setTextAlignment('custom', 'right')
	setTextColor('custom', '9999FF')
    setProperty('custom.antialiasing', true)
	setObjectCamera('custom', 'other')
	addLuaText('custom')
	doTweenY('custom', 'custom', 350, 2, 'expoOut')

	makeLuaSprite('c1', '', 900, 345)
	makeGraphic('c1', 150, 40, '222222')
	setObjectCamera('c1', 'other')

	end

	makeLuaText('change', 'Changelog', 150, 900, 400 - 30)
	setTextSize('change', 20)
	setTextBorder('change', 0)
	setProperty('change.alpha', 0.6)
	setTextFont('change', 'ROCK.TTF')
	setTextAlignment('change', 'right')
    setProperty('change.antialiasing', true)
	setObjectCamera('change', 'other')
	addLuaText('change')
	doTweenY('change', 'change', 400, 2, 'expoOut')

	makeLuaSprite('c2', '', 900, 395)
	makeGraphic('c2', 150, 40, '222222')
	setObjectCamera('c2', 'other')

	makeLuaText('credits', 'Credits', 150, 900, 450 - 30)
	setTextSize('credits', 20)
	setTextBorder('credits', 0)
	setProperty('credits.alpha', 0.6)
	setTextFont('credits', 'ROCK.TTF')
	setTextAlignment('credits', 'right')
    setProperty('credits.antialiasing', true)
	setObjectCamera('credits', 'other')
	addLuaText('credits')
	doTweenY('credits', 'credits', 450, 2, 'expoOut')

	makeLuaSprite('c3', '', 900, 445)
	makeGraphic('c3', 150, 40, '222222')
	setObjectCamera('c3', 'other')

	makeLuaText('quit', 'Quit', 150, 900, 500 - 30)
	setTextSize('quit', 20)
	setTextBorder('quit', 0)
	setProperty('quit.alpha', 0.6)
	setTextFont('quit', 'ROCK.TTF')
	setTextAlignment('quit', 'right')
    setProperty('quit.antialiasing', true)
	setObjectCamera('quit', 'other')
	addLuaText('quit')
	doTweenY('quit', 'quit', 500, 2, 'expoOut')

	makeLuaSprite('q', '', 900, 495)
	makeGraphic('q', 150, 40, '222222')
	setObjectCamera('q', 'other')



	makeLuaSprite('overlay', '')
	makeGraphic('overlay', 1290, 730, '101010')
	setProperty('overlay.alpha', 0)
	setObjectCamera('overlay', 'other')
	addLuaSprite('overlay', true)

	makeLuaText('credtxt1', 'CREDITS', 1280, 0, 200)
	setTextSize('credtxt1', 30)
	setTextBorder('credtxt1', 0)
	setTextFont('credtxt1', 'ROCKB.TTF')
    setProperty('credtxt1.antialiasing', true)
	setObjectCamera('credtxt1', 'other')
	addLuaText('credtxt1', true)
	setProperty('credtxt1.alpha', 0)

	makeLuaText('credtxt2', 'thwl - visuals, sounds, music and programming', 1280, 0, 240)
	setTextSize('credtxt2', 24)
	setTextBorder('credtxt2', 0)
	setTextFont('credtxt2', 'ROCK.TTF')
    setProperty('credtxt2.antialiasing', true)
	setObjectCamera('credtxt2', 'other')
	addLuaText('credtxt2', true)
	setProperty('credtxt2.alpha', 0)

	makeLuaText('credtxt3', 'getsaa - screamers and main menu music', 1280, 0, 280)
	setTextSize('credtxt3', 24)
	setTextBorder('credtxt3', 0)
	setTextFont('credtxt3', 'ROCK.TTF')
    setProperty('credtxt3.antialiasing', true)
	setObjectCamera('credtxt3', 'other')
	addLuaText('credtxt3', true)
	setProperty('credtxt3.alpha', 0)

	makeLuaText('credtxt4', 'shadowmario - psych engine and lua api', 1280, 0, 320)
	setTextSize('credtxt4', 24)
	setTextBorder('credtxt4', 0)
	setTextFont('credtxt4', 'ROCK.TTF')
    setProperty('credtxt4.antialiasing', true)
	setObjectCamera('credtxt4', 'other')
	addLuaText('credtxt4', true)
	setProperty('credtxt4.alpha', 0)

	makeLuaText('credtxt5', 'ninjamuffin - fnf base engine', 1280, 0, 360)
	setTextSize('credtxt5', 24)
	setTextBorder('credtxt5', 0)
	setTextFont('credtxt5', 'ROCK.TTF')
    setProperty('credtxt5.antialiasing', true)
	setObjectCamera('credtxt5', 'other')
	addLuaText('credtxt5', true)
	setProperty('credtxt5.alpha', 0)


	makeLuaText('chantxt1', 'CHANGELOG', 1280, 0, 200)
	setTextSize('chantxt1', 30)
	setTextBorder('chantxt1', 0)
	setTextFont('chantxt1', 'ROCKB.TTF')
    setProperty('chantxt1.antialiasing', true)
	setObjectCamera('chantxt1', 'other')
	addLuaText('chantxt1', true)
	setProperty('chantxt1.alpha', 0)

	makeLuaText('chantxt2', "new main menu, move camera with keyboard, fixed cheese bug, now you can't put one cheese on top of another cheese, the generators now are counting down, new custom night, upper office image done, cheese eat sound, hud anims, useless flashlight, new profile saves, unlockable nights, character pfp, some tvs are disabled when are useless, useless trash can, dialogues in night 5", 500, 0, 240)
	setTextSize('chantxt2', 24)
	setTextBorder('chantxt2', 0)
	setTextFont('chantxt2', 'ROCK.TTF')
    setProperty('chantxt2.antialiasing', true)
	setObjectCamera('chantxt2', 'other')
	addLuaText('chantxt2', true)
	screenCenter('chantxt2', 'x')
	setProperty('chantxt2.alpha', 0)


	makeLuaText('custtxt1', 'CUSTOM HARVEST', 1280, 0, 200)
	setTextSize('custtxt1', 30)
	setTextBorder('custtxt1', 0)
	setTextFont('custtxt1', 'ROCKB.TTF')
    setProperty('custtxt1.antialiasing', true)
	setObjectCamera('custtxt1', 'other')
	addLuaText('custtxt1', true)
	setProperty('custtxt1.alpha', 0)

	makeLuaText('custtxt2', "Highscore: "..getDataFromSave('thwlTests', name..'-night6'), 1280, 0, 240)
	setTextSize('custtxt2', 24)
	setTextBorder('custtxt2', 0)
	setTextFont('custtxt2', 'ROCK.TTF')
    setProperty('custtxt2.antialiasing', true)
	setObjectCamera('custtxt2', 'other')
	addLuaText('custtxt2', true)
	setProperty('custtxt2.alpha', 0)

	makeLuaSprite('selectfish', 'hailey/selectfish', 300, 300)
	setObjectCamera('selectfish', 'other')
	scaleObject('selectfish', 0.7, 0.7)
	addLuaSprite('selectfish', true)
	setProperty('selectfish.alpha', 0)

	makeLuaText('sftxt', 'Level 0', getProperty('selectfish.width'), getProperty('selectfish.x'), getProperty('selectfish.y') + 170)
	setTextSize('sftxt', 20)
	setTextFont('sftxt', 'ROCKB.TTF')
    setProperty('sftxt.antialiasing', true)
	setObjectCamera('sftxt', 'other')
	addLuaText('sftxt')
	setProperty('sftxt.alpha', 0)

	makeLuaSprite('selectmusic', 'hailey/selectmusic', 460, 300)
	setObjectCamera('selectmusic', 'other')
	scaleObject('selectmusic', 0.7, 0.7)
	addLuaSprite('selectmusic', true)
	setProperty('selectmusic.alpha', 0)

	makeLuaText('smtxt', 'Level 0', getProperty('selectmusic.width'), getProperty('selectmusic.x'), getProperty('selectmusic.y') + 170)
	setTextSize('smtxt', 20)
	setTextFont('smtxt', 'ROCKB.TTF')
    setProperty('smtxt.antialiasing', true)
	setObjectCamera('smtxt', 'other')
	addLuaText('smtxt')
	setProperty('smtxt.alpha', 0)

	makeLuaSprite('selectdoor', 'hailey/selectdoor', 620, 300)
	setObjectCamera('selectdoor', 'other')
	scaleObject('selectdoor', 0.7, 0.7)
	addLuaSprite('selectdoor', true)
	setProperty('selectdoor.alpha', 0)

	makeLuaText('sdtxt', 'Level 0', getProperty('selectdoor.width'), getProperty('selectdoor.x'), getProperty('selectdoor.y') + 170)
	setTextSize('sdtxt', 20)
	setTextFont('sdtxt', 'ROCKB.TTF')
    setProperty('sdtxt.antialiasing', true)
	setObjectCamera('sdtxt', 'other')
	addLuaText('sdtxt')
	setProperty('sdtxt.alpha', 0)

	makeLuaSprite('selectcamera', 'hailey/selectcamera', 780, 300)
	setObjectCamera('selectcamera', 'other')
	scaleObject('selectcamera', 0.7, 0.7)
	addLuaSprite('selectcamera', true)
	setProperty('selectcamera.alpha', 0)

	makeLuaText('sctxt', 'Level 0', getProperty('selectcamera.width'), getProperty('selectcamera.x'), getProperty('selectcamera.y') + 170)
	setTextSize('sctxt', 20)
	setTextFont('sctxt', 'ROCKB.TTF')
    setProperty('sctxt.antialiasing', true)
	setObjectCamera('sctxt', 'other')
	addLuaText('sctxt')
	setProperty('sctxt.alpha', 0)

	makeLuaText('pfptxt1', 'PROFILE', 1280, 0, 200)
	setTextSize('pfptxt1', 30)
	setTextBorder('pfptxt1', 0)
	setTextFont('pfptxt1', 'ROCKB.TTF')
    setProperty('pfptxt1.antialiasing', true)
	setObjectCamera('pfptxt1', 'other')
	addLuaText('pfptxt1', true)
	setProperty('pfptxt1.alpha', 0)

	makeLuaSprite('char1', 'hailey/chars/1', 300, 300)
	setObjectCamera('char1', 'other')
	scaleObject('char1', 0.7, 0.7)
	addLuaSprite('char1', true)
	setProperty('char1.alpha', 0)

	makeLuaSprite('char2', 'hailey/chars/0', 460, 300)
	setObjectCamera('char2', 'other')
	scaleObject('char2', 0.7, 0.7)
	addLuaSprite('char2', true)
	setProperty('char2.alpha', 0)

	makeLuaSprite('char3', 'hailey/chars/2', 620, 300)
	setObjectCamera('char3', 'other')
	scaleObject('char3', 0.7, 0.7)
	addLuaSprite('char3', true)
	setProperty('char3.alpha', 0)

	makeLuaSprite('char4', 'hailey/chars/3', 780, 300)
	setObjectCamera('char4', 'other')
	scaleObject('char4', 0.7, 0.7)
	addLuaSprite('char4', true)
	setProperty('char4.alpha', 0)

	makeLuaText('pfptxt2', 'Change Profile', 1280, 0, 500)
	setTextSize('pfptxt2', 24)
	setTextBorder('pfptxt2', 0)
	setTextFont('pfptxt2', 'ROCK.TTF')
    setProperty('pfptxt2.antialiasing', true)
	setObjectCamera('pfptxt2', 'other')
	addLuaText('pfptxt2', true)
	setProperty('pfptxt2.alpha', 0)







	makeLuaText('back', 'Back', 150, 250, 550)
	setTextSize('back', 20)
	setTextBorder('back', 0)
	setTextFont('back', 'ROCK.TTF')
	setTextAlignment('back', 'left')
    setProperty('back.antialiasing', true)
	setObjectCamera('back', 'other')
	addLuaText('back')
	setProperty('back.alpha', 0)

	makeLuaSprite('b', '', 250, 550 - 5)
	makeGraphic('b', 150, 40, '222222')
	setObjectCamera('b', 'other')

	makeLuaText('start', 'Start', 150, 850, 550)
	setTextSize('start', 20)
	setTextBorder('start', 0)
	setTextFont('start', 'ROCK.TTF')
	setTextAlignment('start', 'right')
    setProperty('start.antialiasing', true)
	setObjectCamera('start', 'other')
	addLuaText('start')
	setProperty('start.alpha', 0)

	makeLuaSprite('s', '', 850, 550 - 5)
	makeGraphic('s', 150, 40, '222222')
	setObjectCamera('s', 'other')




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


	if keyboardJustPressed('F12') then
		setDataFromSave('thwlTests', name..'-night1', 1)
		setDataFromSave('thwlTests', name..'-night2', 1)
		setDataFromSave('thwlTests', name..'-night3', 1)
		setDataFromSave('thwlTests', name..'-night4', 1)
		setDataFromSave('thwlTests', name..'-night5', 1)
		restartSong()
	end


	if keyboardJustPressed('F11') then

        if getPropertyFromClass('openfl.Lib', 'application.window.fullscreen') then
            setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
        else
            setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
        end
    end


    if menu ~= '' and mouseOverlaps('b', 'camOther') and not starting then

		if getProperty('back.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('back.alpha', 1)
			setTextString('back', "Back <")
			doTweenX('b', 'back', 250 + 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			if menu == 'credits' then
				doTweenAlpha('credits1', 'credtxt1', 0, 0.5, 'expoOut')
				doTweenAlpha('credits2', 'credtxt2', 0, 0.5, 'expoOut')
				doTweenAlpha('credits3', 'credtxt3', 0, 0.5, 'expoOut')
				doTweenAlpha('credits4', 'credtxt4', 0, 0.5, 'expoOut')
				doTweenAlpha('credits5', 'credtxt5', 0, 0.5, 'expoOut')
			elseif menu == 'change' then
				doTweenAlpha('chan1', 'chantxt1', 0, 0.5, 'expoOut')
				doTweenAlpha('chan2', 'chantxt2', 0, 0.5, 'expoOut')
			elseif menu == 'custom' then
				doTweenAlpha('cust1', 'custtxt1', 0, 0.5, 'expoOut')
				doTweenAlpha('cust2', 'custtxt2', 0, 0.5, 'expoOut')
				doTweenAlpha('selectfish', 'selectfish', 0, 0.5, 'expoOut')
				doTweenAlpha('selectmusic', 'selectmusic', 0, 0.5, 'expoOut')
				doTweenAlpha('selectdoor', 'selectdoor', 0, 0.5, 'expoOut')
				doTweenAlpha('selectcamera', 'selectcamera', 0, 0.5, 'expoOut')
				doTweenAlpha('sftxt', 'sftxt', 0, 0.5, 'expoOut')
				doTweenAlpha('smtxt', 'smtxt', 0, 0.5, 'expoOut')
				doTweenAlpha('sdtxt', 'sdtxt', 0, 0.5, 'expoOut')
				doTweenAlpha('sctxt', 'sctxt', 0, 0.5, 'expoOut')
			elseif menu == 'profile' then
				doTweenAlpha('pfp1', 'pfptxt1', 0, 0.5, 'expoOut')
			doTweenAlpha('pfp2', 'pfptxt2', 0, 0.5, 'expoOut')
			doTweenAlpha('char1', 'char1', 0, 0.5, 'expoOut')
			doTweenAlpha('char2', 'char2', 0, 0.5, 'expoOut')
			doTweenAlpha('char3', 'char3', 0, 0.5, 'expoOut')
			doTweenAlpha('char4', 'char4', 0, 0.5, 'expoOut')
			end

			doTweenAlpha('start', 'start', 0, 0.5, 'expoOut')
			doTweenAlpha('back', 'back', 0, 0.5, 'expoOut')
			doTweenAlpha('overlay', 'overlay', 0, 0.5, 'expoOut')
			menu = ''
		end
	else
		if menu ~= '' then
			setTextString('back', "Back")
			setProperty('back.alpha', 0.6)
			doTweenX('b', 'back', 250, 0.5, 'expoOut')
		end
	end



	if menu == 'custom' and mouseOverlaps('s', 'camOther') and not starting then

		if getProperty('start.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('start.alpha', 1)
			setTextString('start', "> Start")
			doTweenX('s', 'start', 850 - 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 6)
			setDataFromSave('thwlTests', 'fishlevel', fish)
			setDataFromSave('thwlTests', 'musiclevel', music)
			setDataFromSave('thwlTests', 'doorlevel', door)
			setDataFromSave('thwlTests', 'cameralevel', camera)
			onStartNight()
		end
	else
		if menu == 'custom' then
			setTextString('start', "Start")
			setProperty('start.alpha', 0.6)
			doTweenX('s', 'start', 850, 0.5, 'expoOut')
		end
	end




	if menu == 'custom' and mouseOverlaps('selectfish', 'camOther') and not starting then

		if mouseClicked('left') then
			playSound('tick')

			if fish < 0.4 then
				fish = 2
			elseif fish > 0.4 then
				fish = fish - 0.1
			end

			setTextString('sftxt', 'Level '..(20 - (fish * 10)))
		end
	end


	if menu == 'custom' and mouseOverlaps('selectmusic', 'camOther') and not starting then

		if mouseClicked('left') then
			playSound('tick')

			if music < 0.4 then
				music = 2
			elseif music > 0.4 then
				music = music - 0.1
			end

			setTextString('smtxt', 'Level '..(20 - (music * 10)))
		end
	end


	if menu == 'custom' and mouseOverlaps('selectdoor', 'camOther') and not starting then

		if mouseClicked('left') then
			playSound('tick')

			if door < 0.4 then
				door = 2
			elseif door > 0.4 then
				door = door - 0.1
			end

			setTextString('sdtxt', 'Level '..(20 - (door * 10)))
		end
	end

	if menu == 'custom' and mouseOverlaps('selectcamera', 'camOther') and not starting then

		if mouseClicked('left') then
			playSound('tick')

			if camera < 0.4 then
				camera = 2
			elseif camera > 0.4 then
				camera = camera - 0.1
			end

			setTextString('sctxt', 'Level '..(20 - (camera * 10)))
		end
	end
























	if menu == 'profile' and mouseOverlaps('char1', 'camOther') and not starting then

		if mouseClicked('left') then
			playSound('tick')
			setDataFromSave('thwlTests', name..'-pfp', 1)
		end
	end


	if menu == 'profile' and mouseOverlaps('char2', 'camOther') and not starting then

		if mouseClicked('left') then
			playSound('tick')
			setDataFromSave('thwlTests', name..'-pfp', 0)
		end
	end


	if menu == 'profile' and mouseOverlaps('char3', 'camOther') and not starting then

		if mouseClicked('left') then
			playSound('tick')
			setDataFromSave('thwlTests', name..'-pfp', 2)
		end
	end

	if menu == 'profile' and mouseOverlaps('char4', 'camOther') and not starting then

		if mouseClicked('left') then
			playSound('tick')
			setDataFromSave('thwlTests', name..'-pfp', 3)
		end
	end


	if menu == 'profile' and mouseOverlaps('pfptxt2', 'camOther') and not starting then

		if mouseClicked('left') then
			loadSong('begin')
		end
	end








	if menu == '' and mouseOverlaps('n1', 'camOther') and not starting then

		if getProperty('night1.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night1.alpha', 1)
			setTextString('night1', "Monday's Harvest <")
			doTweenX('n1', 'night1', 200 + 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 1)
			onStartNight()
		end
	else
		setTextString('night1', "Monday's Harvest")
		setProperty('night1.alpha', 0.6)
		doTweenX('n1', 'night1', 200, 0.5, 'expoOut')
	end




	if getDataFromSave('thwlTests', name..'-night1') == 1 and menu == '' and mouseOverlaps('n2', 'camOther') and not starting then

		if getProperty('night2.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night2.alpha', 1)
			setTextString('night2', "Tuesday's Harvest <")
			doTweenX('n2', 'night2', 200 + 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 2)
			onStartNight()
		end
	else
		setTextString('night2', "Tuesday's Harvest")
		setProperty('night2.alpha', 0.6)
		doTweenX('n2', 'night2', 200, 0.5, 'expoOut')
	end



	if getDataFromSave('thwlTests', name..'-night2') == 1 and menu == '' and mouseOverlaps('n3', 'camOther') and not starting then

		if getProperty('night3.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night3.alpha', 1)
			setTextString('night3', "Wednesday's Harvest <")
			doTweenX('n3', 'night3', 200 + 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 3)
			onStartNight()
		end
	else
		setTextString('night3', "Wednesday's Harvest")
		setProperty('night3.alpha', 0.6)
		doTweenX('n3', 'night3', 200, 0.5, 'expoOut')
	end





	if getDataFromSave('thwlTests', name..'-night3') == 1 and menu == '' and mouseOverlaps('n4', 'camOther') and not starting then

		if getProperty('night4.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night4.alpha', 1)
			setTextString('night4', "Thursday's Harvest <")
			doTweenX('n4', 'night4', 200 + 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 4)
			onStartNight()
		end
	else
		setTextString('night4', "Thursday's Harvest")
		setProperty('night4.alpha', 0.6)
		doTweenX('n4', 'night4', 200, 0.5, 'expoOut')
	end



	if getDataFromSave('thwlTests', name..'-night4') == 1 and menu == '' and mouseOverlaps('n5', 'camOther') and not starting then

		if getProperty('night5.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('night5.alpha', 1)
			setTextString('night5', "Friday's Harvest <")
			doTweenX('n5', 'night5', 200 + 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			setDataFromSave('thwlTests', 'night', 5)
			onStartNight()
		end
	else
		setTextString('night5', "Friday's Harvest")
		setProperty('night5.alpha', 0.6)
		doTweenX('n5', 'night5', 200, 0.5, 'expoOut')
	end





	if getDataFromSave('thwlTests', name..'-night5') == 1 and menu == '' and mouseOverlaps('c1', 'camOther') and not starting then

		if getProperty('custom.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('custom.alpha', 1)
			setTextString('custom', '> Custom Harvest')
			doTweenX('c1', 'custom', 880 - 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			doTweenAlpha('cust1', 'custtxt1', 1, 0.5, 'expoOut')
			doTweenAlpha('cust2', 'custtxt2', 1, 0.5, 'expoOut')
			doTweenAlpha('selectfish', 'selectfish', 1, 0.5, 'expoOut')
			doTweenAlpha('selectmusic', 'selectmusic', 1, 0.5, 'expoOut')
			doTweenAlpha('selectdoor', 'selectdoor', 1, 0.5, 'expoOut')
			doTweenAlpha('selectcamera', 'selectcamera', 1, 0.5, 'expoOut')
			doTweenAlpha('sftxt', 'sftxt', 1, 0.5, 'expoOut')
			doTweenAlpha('smtxt', 'smtxt', 1, 0.5, 'expoOut')
			doTweenAlpha('sdtxt', 'sdtxt', 1, 0.5, 'expoOut')
			doTweenAlpha('sctxt', 'sctxt', 1, 0.5, 'expoOut')
			doTweenAlpha('start', 'start', 1, 0.5, 'expoOut')
			doTweenAlpha('back', 'back', 1, 0.5, 'expoOut')
			doTweenAlpha('overlay', 'overlay', 0.5, 0.5, 'expoOut')
			menu = 'custom'
		end
	else
		setTextString('custom', 'Custom Harvest')
		setProperty('custom.alpha', 0.6)
		doTweenX('c1', 'custom', 880, 0.5, 'expoOut')
	end




	if menu == '' and mouseOverlaps('c2', 'camOther') and not starting then

		if getProperty('change.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('change.alpha', 1)
			setTextString('change', '> Changelog')
			doTweenX('c2', 'change', 900 - 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			doTweenAlpha('chan1', 'chantxt1', 1, 0.5, 'expoOut')
			doTweenAlpha('chan2', 'chantxt2', 1, 0.5, 'expoOut')
			doTweenAlpha('back', 'back', 1, 0.5, 'expoOut')
			doTweenAlpha('overlay', 'overlay', 0.5, 0.5, 'expoOut')
			menu = 'change'
		end
	else
		setTextString('change', 'Changelog')
		setProperty('change.alpha', 0.6)
		doTweenX('c2', 'change', 900, 0.5, 'expoOut')
	end





	if menu == '' and mouseOverlaps('c3', 'camOther') and not starting then

		if getProperty('credits.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('credits.alpha', 1)
			setTextString('credits', '> Credits')
			doTweenX('c3', 'credits', 900 - 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			doTweenAlpha('credits1', 'credtxt1', 1, 0.5, 'expoOut')
			doTweenAlpha('credits2', 'credtxt2', 1, 0.5, 'expoOut')
			doTweenAlpha('credits3', 'credtxt3', 1, 0.5, 'expoOut')
			doTweenAlpha('credits4', 'credtxt4', 1, 0.5, 'expoOut')
			doTweenAlpha('credits5', 'credtxt5', 1, 0.5, 'expoOut')
			doTweenAlpha('back', 'back', 1, 0.5, 'expoOut')
			doTweenAlpha('overlay', 'overlay', 0.5, 0.5, 'expoOut')
			menu = 'credits'
		end
	else
		setTextString('credits', 'Credits')
		setProperty('credits.alpha', 0.6)
		doTweenX('c3', 'credits', 900, 0.5, 'expoOut')
	end





	if menu == '' and mouseOverlaps('q', 'camOther') and not starting then

		if getProperty('quit.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('quit.alpha', 1)
			setTextString('quit', '> Quit')
			doTweenX('q1', 'quit', 900 - 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			os.exit()
		end
	else
		setTextString('quit', 'Quit')
		setProperty('quit.alpha', 0.6)
		doTweenX('q1', 'quit', 900, 0.5, 'expoOut')
	end



if menu == '' and mouseOverlaps('p', 'camOther') and not starting then

		if getProperty('profile.alpha') ~= 1 then
			playSound('scrollMenu', 0.5)
			setProperty('profile.alpha', 1)
			setTextString('profile', 'Profile <')
			doTweenX('p1', 'profile', 200 + 10, 0.5, 'expoOut')
		end

		if mouseClicked('left') then
			doTweenAlpha('pfp1', 'pfptxt1', 1, 0.5, 'expoOut')
			doTweenAlpha('pfp2', 'pfptxt2', 1, 0.5, 'expoOut')
			doTweenAlpha('char1', 'char1', 1, 0.5, 'expoOut')
			doTweenAlpha('char2', 'char2', 1, 0.5, 'expoOut')
			doTweenAlpha('char3', 'char3', 1, 0.5, 'expoOut')
			doTweenAlpha('char4', 'char4', 1, 0.5, 'expoOut')
			doTweenAlpha('back', 'back', 1, 0.5, 'expoOut')
			doTweenAlpha('overlay', 'overlay', 0.5, 0.5, 'expoOut')
			menu = 'profile'
		end
	else
		setTextString('profile', 'Profile')
		setProperty('profile.alpha', 0.6)
		doTweenX('p1', 'profile', 200, 0.5, 'expoOut')
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