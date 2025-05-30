local shaderName = "perspective"

function onCreate()
    camPos = 0
    canCam = true
    warn = false
    hiding = false
    cooldown = false

    nymphaea = 0
    lilium = 0
    sativus = 0

    item = ''
    tasks = 0
    needTasks = 1

    needItem1 = ''
    needItem2 = ''
    needItem3 = ''

    cheese = 30
    rat = true
    musicFile = 1
    needMusic = 1
    soulPos = 1
    die = false
    win = false

    volume = 1
    lights = true
    repairing = false

    night = getDataFromSave('thwlTests', 'night')

    soul1 = true
    soul2 = true
    soul3 = true
    soul0 = true
    ultimate = true
    ttk = 1

    if night == 1 then
        ultimate = false
        needTasks = 12
        difficulty = 2.3
        soul2 = false
        soul3 = false
        soul0 = false
        ultimate = false
    elseif night == 2 then
        ultimate = false
        needTasks = 12
        difficulty = 1.9
        soul3 = false
        soul0 = false
    elseif night == 3 then
        ultimate = false
        needTasks = 12
        difficulty = 1.4
        soul2 = false
        runTimer('rare', getRandomInt(120, 220))
    elseif night == 4 then
        ultimate = false
        needTasks = 12
        difficulty = 0.9
        runTimer('rare', getRandomInt(120, 220))
    elseif night == 5 then
        soul3 = false
        ttk = 1.5
        needTasks = 12
        difficulty = 0.4
        runTimer('rare', getRandomInt(100, 220))
    end
    

    

    jumpscared = false
    canRestart = false




    precacheMusic('music')
    precacheMusic('office')
    precacheMusic('custom')
    precacheSound('empty')
    playSound('empty', 0.4 * volume, 'empty', true)
    runTimer('music')
    setProperty('cameraSpeed', 10)

	makeLuaSprite('bg', 'hailey/bg2')
    setScrollFactor('bg', 0, 0)
	addLuaSprite('bg')
    setProperty('bg.alpha', 0.3)

    makeLuaSprite('office', 'hailey/bg')
    setProperty('office.antialiasing', false)
    addLuaSprite('office')

    makeLuaSprite('soul0i', 'hailey/soul0-idle', 1530, 430)
    setBlendMode('soul0i', 'add')
    setProperty('soul0i.alpha', 0)
    addLuaSprite('soul0i')

    makeLuaSprite('soul0a', 'hailey/soul0-anim', 1530, 430)
    setBlendMode('soul0a', 'add')
    setProperty('soul0a.alpha', 0)
    addLuaSprite('soul0a')

    makeLuaSprite('soul0c', 'hailey/camera', 1530, 430)
    setBlendMode('soul0c', 'add')
    setProperty('soul0c.alpha', 0)
    addLuaSprite('soul0c')

    makeLuaSprite('thing', 'hailey/light2', 2320, 320)
    setBlendMode('thing', 'add')
    addLuaSprite('thing')

    makeLuaSprite('soul3', 'hailey/soul3anim', 2200, 70)
    setBlendMode('soul3', 'add')
    setProperty('soul3.alpha', 0)
    addLuaSprite('soul3')

    runTimer('soul3anim', 0.3, 99999)

    makeLuaSprite('site', 'hailey/site', 1670, 230)
    setBlendMode('site', 'add')
    setProperty('site.alpha', 1)
    addLuaSprite('site')

    makeLuaText('site_t', '1-A', 250, 1660, 300)
    setTextSize('site_t', 24)
    setObjectCamera('site_t', 'game')
    setProperty('site_t.antialiasing', true)
    setScrollFactor('site_t', 1, 1)
    setTextBorder('site_t', 0)
    addLuaText('site_t', true)

    makeLuaSprite('warn', 'hailey/warn', 1825, 410)
    setBlendMode('warn', 'add')
    setProperty('warn.alpha', 0)
    addLuaSprite('warn')


    if night ~= 5 then
        makeLuaSprite('light', 'hailey/light')
        setBlendMode('light', 'add')
        addLuaSprite('light', true)
    elseif night == 5 then
        makeLuaSprite('fog1', 'hailey/fog')
        setBlendMode('fog1', 'add')
        addLuaSprite('fog1')

        makeLuaSprite('fog2', 'hailey/fog', 4000)
        setBlendMode('fog2', 'add')
        addLuaSprite('fog2')

        doTweenX('fog1', 'fog1', -4000, 70)
        doTweenX('fog2', 'fog2', 0, 70)
    end

    makeLuaSprite('hide_h', '', 3200, 50)
    makeGraphic('hide_h', 520, 520, '888888')

    makeLuaSprite('sound_h', '', 2720, 350)
    makeGraphic('sound_h', 250, 250, '888888')

    makeLuaText('iwanna', 'i would like to listen to '..needMusic, 250, 2720, 400)
    setTextSize('iwanna', 20)
    setObjectCamera('iwanna', 'game')
    setScrollFactor('iwanna', 1, 1)
    setProperty('iwanna.antialiasing', true)
    setTextBorder('iwanna', 0)
    addLuaText('iwanna', true)

    makeLuaText('file', '< '..musicFile..'.wav >', 250, 2720, 460)
    setTextSize('file', 30)
    setObjectCamera('file', 'game')
    setScrollFactor('file', 1, 1)
    setProperty('file.antialiasing', true)
    setTextBorder('file', 0)
    addLuaText('file', true)

    makeLuaSprite('warn_h', '', 1780, 400)
    makeGraphic('warn_h', 150, 170, '888888')

    makeLuaSprite('asis_h', '', 100, 300)
    makeGraphic('asis_h', 330, 300, '888888')

    makeLuaSprite('gabinet_h', '', 1520, 640)
    makeGraphic('gabinet_h', 300, 80, '888888')

    makeLuaText('gabinet_t', cheese, 300, 1520, 660)
    setTextSize('gabinet_t', 30)
    setObjectCamera('gabinet_t', 'game')
    setScrollFactor('gabinet_t', 1, 1)
    setTextFont('gabinet_t', 'ROCK.TTF')
    setProperty('gabinet_t.antialiasing', true)
    setTextBorder('gabinet_t', 0)
    addLuaText('gabinet_t', true)

    makeLuaSprite('nymphaea_h', '', 850, 120)
    makeGraphic('nymphaea_h', 220, 460, '888888')

    makeLuaText('nymphaea_t', '...', 220, 850, 500)
    setTextSize('nymphaea_t', 30)
    setObjectCamera('nymphaea_t', 'game')
    setScrollFactor('nymphaea_t', 1, 1)
    setTextFont('nymphaea_t', 'ROCK.TTF')
    setProperty('nymphaea_t.antialiasing', true)
    setTextBorder('nymphaea_t', 0)
    addLuaText('nymphaea_t', true)

    makeLuaSprite('lilium_h', '', 500, 420)
    makeGraphic('lilium_h', 190, 170, '888888')

    makeLuaText('lilium_t', '...', 190, 500, 500)
    setTextSize('lilium_t', 30)
    setObjectCamera('lilium_t', 'game')
    setScrollFactor('lilium_t', 1, 1)
    setTextFont('lilium_t', 'ROCK.TTF')
    setProperty('lilium_t.antialiasing', true)
    setTextBorder('lilium_t', 0)
    addLuaText('lilium_t', true)

    makeLuaSprite('sativus_h', '', 330, 20)
    makeGraphic('sativus_h', 190, 300, '888888')

    makeLuaText('sativus_t', '...', 190, 330, 220)
    setTextSize('sativus_t', 30)
    setObjectCamera('sativus_t', 'game')
    setTextFont('sativus_t', 'ROCK.TTF')
    setScrollFactor('sativus_t', 1, 1)
    setProperty('sativus_t.antialiasing', true)
    setTextBorder('sativus_t', 0)
    addLuaText('sativus_t', true)

    makeLuaSprite('rat', 'hailey/bg1', 0, 720)
    setScrollFactor('rat', 0, 1)
    addLuaSprite('rat')

    makeLuaSprite('cheeseActive', 'hailey/cheese', 360, 1260)
    setScrollFactor('cheeseActive', 0, 1)
    setProperty('cheeseActive.alpha', 1)
    addLuaSprite('cheeseActive')

    runTimer('light', getRandomFloat(0.1, 2))

    makeLuaSprite('static', 'hailey/static')
    setProperty('static.antialiasing', false)
    addLuaSprite('static')
    setScrollFactor('static', 0, 0)
    setBlendMode('static', 'multiply')
    setProperty('static.alpha', 0.5)

    makeLuaSprite('camLeft', '')
    makeGraphic('camLeft', 120, 720, 'FFFFFF')
    setObjectCamera('camLeft', 'other')

    makeLuaSprite('camRight', '', 1160, 0)
    makeGraphic('camRight', 120, 720, 'FFFFFF')
    setObjectCamera('camRight', 'other')

    makeLuaSprite('camDown', 'hailey/hover0', 800, 630)
    setObjectCamera('camDown', 'other')
    setProperty('camDown.antialiasing', false)
    setBlendMode('camDown', 'add')

    

    if not getDataFromSave('thwlTests', 'tutorial') then

    setDataFromSave('thwlTests', 'tutorial', true) 

    makeLuaText('tuto_left', 'A to look left', 140, 130, 340)
    setTextSize('tuto_left', 24)
    setTextAlignment('tuto_left', 'left')
    setTextFont('tuto_left', 'ROCK.TTF')
    setProperty('tuto_left.antialiasing', true)
    setTextBorder('tuto_left', 0)
    addLuaText('tuto_left', true)

    makeLuaText('tuto_right', 'D to look right', 150, 950, 340)
    setTextSize('tuto_right', 24)
    setTextAlignment('tuto_right', 'right')
    setTextFont('tuto_right', 'ROCK.TTF')
    setProperty('tuto_right.antialiasing', true)
    setTextBorder('tuto_right', 0)
    addLuaText('tuto_right', true)

    makeLuaText('tuto_down', 'Space to look down', 1280, 0, 620)
    setTextSize('tuto_down', 24)
    setTextFont('tuto_down', 'ROCK.TTF')
    setProperty('tuto_down.antialiasing', true)
    setTextBorder('tuto_down', 0)
    addLuaText('tuto_down', true)

    makeLuaText('tuto_reset', 'R to Reset', 1280, 0, 60)
    setTextSize('tuto_reset', 24)
    setTextFont('tuto_reset', 'ROCK.TTF')
    setProperty('tuto_reset.antialiasing', true)
    setTextBorder('tuto_reset', 0)
    addLuaText('tuto_reset', true)

    makeLuaText('tuto_menu', 'P to Menu', 1280, 0, 100)
    setTextSize('tuto_menu', 24)
    setTextFont('tuto_menu', 'ROCK.TTF')
    setProperty('tuto_menu.antialiasing', true)
    setTextBorder('tuto_menu', 0)
    addLuaText('tuto_menu', true)

    runTimer('tutorial', 15)

    end

    makeLuaSprite('hiding', '', 0, 0)
    makeGraphic('hiding', 1280, 720, '000000')
    setObjectCamera('hiding', 'other')
    setProperty('hiding.alpha', 0)
    addLuaSprite('hiding')

    makeLuaSprite('zone', '', 900, 20)
    makeGraphic('zone', 500, 20, 'FFFFFF')

    makeLuaSprite('cfobj', '', 0, 300)
    makeGraphic('cfobj', 20, 20, 'FFFFFF')

    runTimer('ratEat', 30 * difficulty)
    runTimer('dieStep', getRandomInt(8, 15) * difficulty)
    runTimer('changeSound', getRandomInt(40, 50))
    runTimer('newTask', getRandomInt(3, 6))
    runTimer('warn', getRandomInt(15, 25) * difficulty)
    runTimer('sayCheese', getRandomInt(23, 30) * difficulty)

    runTimer('punches', getRandomInt(23, 30) * difficulty)
    runTimer('hideLaugh', getRandomInt(20, 25) * difficulty)
    runTimer('lightLaugh', getRandomInt(10, 20))


    shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

    makeLuaSprite("perspective")
    makeGraphic("shaderImage", screenWidth, screenHeight)

   setSpriteShader("shaderImage", "perspective")


    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("perspective").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("perspective").shader)]);
        
    ]])

end





function onCreatePost()

    setProperty('camFollow.y', 360)
    setProperty('camFollow.x', 2000)

    makeLuaSprite('nymphaea', 'hailey/nymphaea')
    setObjectCamera('nymphaea', 'other')
    scaleObject('nymphaea', 0.5, 0.5)
    addLuaSprite('nymphaea')
    setBlendMode('nymphaea', 'add')
    setProperty('nymphaea.alpha', 0)

    makeLuaSprite('lilium', 'hailey/lilium')
    setObjectCamera('lilium', 'other')
    scaleObject('lilium', 0.5, 0.5)
    addLuaSprite('lilium')
    setBlendMode('lilium', 'add')
    setProperty('lilium.alpha', 0)

    makeLuaSprite('sativus', 'hailey/sativus')
    setObjectCamera('sativus', 'other')
    scaleObject('sativus', 0.5, 0.5)
    addLuaSprite('sativus')
    setBlendMode('sativus', 'add')
    setProperty('sativus.alpha', 0)

    makeLuaSprite('cheese', 'hailey/cheese')
    setObjectCamera('cheese', 'other')
    scaleObject('cheese', 0.5, 0.5)
    addLuaSprite('cheese')
    setProperty('cheese.alpha', 0)

    makeLuaSprite('dark', 'hailey/dark')
    setObjectCamera('dark', 'other')
    addLuaSprite('dark', true)

    makeLuaText('night', 'Night '..getDataFromSave('thwlTests', 'night'), 0, 80, 50)
    setTextSize('night', 20)
    setTextBorder('night', 0)
    setProperty('night.alpha', 0.6)
    setObjectCamera('night', 'other')
    setTextFont('night', 'ROCK.TTF')
    setProperty('night.antialiasing', true)
    addLuaText('night')
    setProperty('night.alpha', 0.3)

    makeLuaText('tasks', '?', 1200, 0, 50)
    setTextSize('tasks', 20)
    setTextAlignment('tasks', 'right')
    setObjectCamera('tasks', 'other')
    setTextBorder('tasks', 0)
    setTextFont('tasks', 'ROCK.TTF')
    setProperty('tasks.antialiasing', true)
    addLuaText('tasks', true)
    setProperty('tasks.alpha', 0.3)

    if night == 5 then
        makeLuaSprite('difficulty', '')
        makeGraphic('difficulty', 1281, 721, '440000')
        setObjectCamera('difficulty', 'other')
        setBlendMode('difficulty', 'multiply')
        setProperty('difficulty.alpha', 0.6)
        addLuaSprite('difficulty', true)
    end

    makeLuaSprite('bs', '')
    makeGraphic('bs', 4000, 4000, '000000')
    addLuaSprite('bs', true)
    setProperty('bs.alpha', 0)

    makeLuaText('lightreset', 'disconnect services', 200, 190, 400)
    setTextSize('lightreset', 32)
    setTextBorder('lightreset', 0)
    setTextColor('lightreset', '00FF00')
    setProperty('lightreset.antialiasing', true)
    addLuaText('lightreset', true)
    setObjectCamera('lightreset', 'game')
    setScrollFactor('lightreset', 1, 1)
    setProperty('lightreset.alpha', 1)

    makeLuaSprite('blackScreen', '')
    makeGraphic('blackScreen', 1280, 720, '000000')
    setObjectCamera('blackScreen', 'other')
    addLuaSprite('blackScreen', true)
    doTweenAlpha('b', 'blackScreen', 0, 2)



    makeLuaText('cursor', '°')
    setTextSize('cursor', 30)
    setObjectCamera('cursor', 'other')
    setTextBorder('cursor', 0)
    addLuaText('cursor', true)
    setTextFont('cursor', 'ROCC.TTF')
    setProperty('cursor.antialiasing', true)

end





function onUpdate()

    setShaderFloat("perspective", "iTime", os.clock())

    setProperty('cfobj.x', getProperty('camFollow.x') - 620)

    setProperty('soul3.y', 70 + (getProperty('soul3.angle') * 2))
    setProperty('soul3.x', 2200 + getProperty('soul3.angle'))

    setProperty('thing.alpha', getRandomFloat(0.3, 1))
    setProperty('site.alpha', getRandomFloat(0.7, 1))
    setProperty('site_t.alpha', getProperty('site.alpha'))

    if night ~= 5 then
        changeDiscordPresence("Hailey's Fate | Harvest "..night, 'Tasks: '..tasks..'/'..needTasks, '', true, 0, 'normal')
    elseif night == 5 then
        changeDiscordPresence("Hailey's Fate | Harvest "..night, 'Tasks: '..tasks..'/'..needTasks, '', true, 0, 'hard')
    end

    if mouseClicked('left') and canRestart then
        restartSong()
    end

    if night == 5 and lights then
        setProperty('camGame.x', getRandomInt(-1, 1))
    end

    setTextString('iwanna', 'i want to listen to:'..needMusic)
    setTextString('tasks', 'Tasks: '..tasks..' / '..needTasks)
    setProperty('bg.flipY', getRandomBool(50))
    setProperty('bg.flipX', getRandomBool(50))
    setProperty('static.flipY', getRandomBool(50))
    setProperty('static.flipX', getRandomBool(50))

    setProperty('cursor.x', getMouseX('other'))
    setProperty('cursor.y', getMouseY('other'))

    doTweenX('nymphaeax', 'nymphaea', getMouseX('other'), 2, 'expoOut')
    doTweenY('nymphaeay', 'nymphaea', getMouseY('other'), 2, 'expoOut')

    doTweenX('liliumx', 'lilium', getMouseX('other'), 0.4, 'expoOut')
    doTweenY('liliumy', 'lilium', getMouseY('other'), 0.4, 'expoOut')

    doTweenX('sativusx', 'sativus', getMouseX('other'), 1, 'expoOut')
    doTweenY('sativusy', 'sativus', getMouseY('other'), 1, 'expoOut')

    doTweenX('cheesex', 'cheese', getMouseX('other'), 0.1, 'expoOut')
    doTweenY('cheesey', 'cheese', getMouseY('other'), 0.1, 'expoOut')

    if mouseOverlaps('sound_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        playSound('tv', 1 * volume)

        if musicFile < 4 then
            musicFile = musicFile + 1
        elseif musicFile == 4 then
            musicFile = 1
        end

        setTextString('file', '< '..musicFile..'.wav >')
        runTimer('killSound2', 4 * difficulty)
    end


    if camPos == 1 and mouseClicked('left') and not hiding and not cooldown then
        if item == 'cheese' and getProperty('cheeseActive.alpha') == 0 then
            playSound('inventory', 1 * volume)
            setProperty('cheeseActive.alpha', 1)
            setProperty('cheese.alpha', 0)
            cancelTimer('ratKill')

            if (tasks * 100 / needTasks) <= 40 then
                runTimer('ratEat', getRandomInt(30, 45) * difficulty)
            elseif (tasks * 100 / needTasks) > 40 and (tasks * 100 / needTasks) <= 70 then
                runTimer('ratEat', getRandomInt(18, 25) * difficulty)
            elseif (tasks * 100 / needTasks) > 70 then
                runTimer('ratEat', getRandomInt(8, 12) * difficulty)
            end

            item = ''
        end
    end

    if mouseOverlaps('gabinet_h', 'game') and mouseClicked('left') and not hiding and not cooldown and item ~= 'cheese' then
        if cheese > 0 then
            getItem('cheese')
            cheese = cheese - 1
            setTextString('gabinet_t', cheese)
            playSound('open'..getRandomInt(1, 2), 0.5 * volume)
        end
    end

    if mouseOverlaps('warn_h', 'game') and mouseClicked('left') and warn and not hiding and not cooldown then
        playSound('alarm', 1 * volume)
        cancelTimer('warnAnim1')
        cancelTimer('warnAnim2')
        setProperty('warn.alpha', 0)
        warn = false
        runTimer('warn', getRandomInt(20, 35) * difficulty)
    end

    if mouseOverlaps('hide_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        doTweenAlpha('hiding1', 'hiding', 1, 0.5)
        cooldown = true
        runTimer('cooldown', 1)
        playSound('open'..getRandomInt(1, 2), 0.3 * volume)
    end

    if mouseOverlaps('nymphaea_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        if nymphaea == 0 then
            nymphaea = 1
            playSound('generator', 0.6 * volume)
            setTextString('nymphaea_t', 'Time: '..nymphaea)
            runTimer('nymphaea', 1, 10)
            playSound('nymphaea', 0.2 * volume, 'nymphaea')
        elseif nymphaea == 10 and item ~= 'nymphaea' then
            setTextString('nymphaea_t', '...')
            nymphaea = 0
            getItem('nymphaea')
        end
    end

    if mouseOverlaps('lilium_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        if lilium == 0 then
            playSound('generator', 0.6 * volume)
            lilium = 1
            setTextString('lilium_t', 'Time: '..lilium)
            runTimer('lilium', 0.7, 15)
            playSound('lilium', 0.3 * volume, 'lilium')
        elseif lilium == 15 and item ~= 'lilium' then
            setTextString('lilium_t', '...')
            lilium = 0
            getItem('lilium')
        end
    end

    if mouseOverlaps('sativus_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        if sativus == 0 then
            playSound('generator', 0.6 * volume)
            sativus = 1
            setTextString('sativus_t', 'Time: '..sativus)

            runTimer('sativus', 1.3, 15)
            playSound('sativus', 0.1 * volume, 'sativus')
        elseif sativus == 15 and item ~= 'sativus' then
            setTextString('sativus_t', '...')
            sativus = 0
            getItem('sativus')
        end
    end


    if mouseOverlaps('asis_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        if lights then
            lightsDown()
        elseif not lights and not repairing then
            repairing = true
            playSound('repair', 0.3)
            setTextString('lightreset', '...')
            runTimer('repairing', 10)
        end
    end

    if mouseClicked('left') and hiding and not cooldown then
        doTweenAlpha('hiding2', 'hiding', 0, 0.5)
        cooldown = true
        runTimer('cooldown', 1)
        playSound('open'..getRandomInt(1, 2), 0.3 * volume)
    end

    if keyboardPressed('A') and camPos == 0 and not hiding and not cooldown then   
        if getProperty('camFollow.x') > 660 then
            setProperty('camLeft.alpha', 0.05)
            setProperty('camFollow.x', getProperty('camFollow.x') - 30)
        else
            setProperty('camLeft.alpha', 0)
        end
    else
        setProperty('camLeft.alpha', 0)
    end

    if keyboardPressed('D') and camPos == 0 and not hiding and not cooldown then 
        if getProperty('camFollow.x') < 3200 then
            setProperty('camRight.alpha', 0.05)
            setProperty('camFollow.x', getProperty('camFollow.x') + 30)
        else
            setProperty('camRight.alpha', 0)
        end
    else
        setProperty('camRight.alpha', 0)
    end

    if keyboardJustPressed('SPACE') and not hiding and not cooldown then

        setProperty('camDown.alpha', 0.6)
        cameraFlash('game', 'black', 0.3, true)
        if camPos == 0 and canCam then
            canCam = false
            doTweenY('camFollow', 'camFollow', 360 + 720, 0.4, 'expoOut')
            camPos = 1
            runTimer('canCam', 0.41)
            playSound('move', 1)
        elseif camPos == 1 and canCam then
            canCam = false
            doTweenY('camFollow', 'camFollow', 360, 0.4, 'expoOut')
            camPos = 0
            runTimer('canCam', 0.41)
            playSound('move', 1)
        end
    else
        setProperty('camDown.alpha', 0.3)
    end




    if mouseOverlaps('needItem1', 'game') and mouseClicked('left') and item == needItem1 and needItem2 == '' then
        playSound('heal', 0.2 * volume)
        removeLuaSprite('needItem1')
        setProperty('nymphaea.alpha', 0)
        setProperty('lilium.alpha', 0)
        setProperty('sativus.alpha', 0)
        item = ''
        needItem1 = ''

        checkItems()
    end

    if mouseOverlaps('needItem2', 'game') and mouseClicked('left') and item == needItem2 and needItem3 == '' then
        playSound('heal', 0.2 * volume)
        removeLuaSprite('needItem2')
        setProperty('nymphaea.alpha', 0)
        setProperty('lilium.alpha', 0)
        setProperty('sativus.alpha', 0)
        item = ''
        needItem2 = ''

        checkItems()
    end

    if mouseOverlaps('needItem3', 'game') and mouseClicked('left') and item == needItem3 then
        playSound('heal', 0.2 * volume)
        removeLuaSprite('needItem3')
        setProperty('nymphaea.alpha', 0)
        setProperty('lilium.alpha', 0)
        setProperty('sativus.alpha', 0)
        item = ''
        needItem3 = ''

        checkItems()
    end


end



function onTimerCompleted(tag)

    if tag == 'tutorial' then
        removeLuaText('tuto_left')
        removeLuaText('tuto_right')
        removeLuaText('tuto_down')
        removeLuaText('tuto_reset')
        removeLuaText('tuto_menu')
    end

    if tag == 'punches' and not jumpscared and ultimate then
        playSound('punchs')
        runTimer('punchesEnd', 1.6)

        cancelTimer('lightLaugh')
        runTimer('lightLaugh', getRandomInt(6, 15)) --LLTIME
        cancelTimer('hideLaugh')
        runTimer('hideLaugh', getRandomInt(5, 15))
    end


    if tag == 'punchesEnd' and not jumpscared and ultimate then
        runTimer('punchesRepeat', 0.5, 3)
        runTimer('punchesthing', 1.6)

        if camPos == 0 then
            onJumpscare('her')
        end

        runTimer('punches', getRandomInt(6, 15))
    end

    if tag == 'punchesRepeat' and not jumpscared and ultimate then
        if camPos == 0 then
            onJumpscare('her')
        end

        runTimer('punches', getRandomInt(6, 15)) --PTIME
    end

    if tag == 'punchesthing' then
        playSound('')
    end




    if tag == 'hideLaugh' and ultimate and not jumpscared then
        cancelTimer('sayCheese')
        cancelTimer('lightLaugh')

        playSound('laugh'..getRandomInt(0, 1))
        runTimer('laughDead1', 3)

        cancelTimer('punches')
        runTimer('punches', getRandomInt(6, 15))
    end



    if tag == 'laughDead1' and not jumpscared and ultimate then
        if hiding then
            playSound('')
            runTimer('hideLaugh', getRandomInt(5, 15))
            runTimer('punches', getRandomInt(6, 15))
            runTimer('lightLaugh', getRandomInt(6, 15))
        elseif not hiding then
            onJumpscare('her')
        end
    end




    if tag == 'lightLaugh' and ultimate and not jumpscared then
        cancelTimer('sayCheese')
        cancelTimer('ratEat')
        cancelTimer('changeSound')

        cancelTimer('hideLaugh')
        cancelTimer('punches')

        playSound('laugh'..getRandomInt(2, 3))
        runTimer('laughDead2', 3)
    end

    if tag == 'laughDead2' and not jumpscared and ultimate then
        cancelTimer('hideLaugh')
        runTimer('punches', getRandomInt(6, 15))

        if not lights then
            playSound('open')
        elseif lights then
            onJumpscare('her')
        end
    end






    if tag == 'repairing' then
        lights = true
        volume = 1
        setSoundVolume('empty', 0.4)
        repairing = false
        setTextString('lightreset', 'disconnect services')
        playSound('lights')
        doTweenAlpha('bs', 'bs', 0, 1, 'bounceOut')

        if night == 5 then
            runTimer('ratEat', getRandomInt(8, 12))
            runTimer('changeSound', getRandomInt(15, 30) * difficulty)
            runTimer('hideLaugh', getRandomInt(5, 15)) --HLTIME
            runTimer('lightLaugh', getRandomInt(10, 15)) --LLTIME
        end
    end





    if tag == 'sayCheese' and soul0 then
        cancelTimer('lightLaugh')
        cancelTimer('hideLaugh')
        cancelTimer('changeSound')
        cancelTimer('punches')

        setProperty('soul0i.alpha', 1)
        playSound('saycheese', 0.7 * volume)
        runTimer('sayCheese1', 3)
        runTimer('changeSound', getRandomInt(15, 30) * difficulty) --CSTIME
    end

    if tag == 'sayCheese1' and lights then
        setProperty('soul0i.alpha', 0)
        setProperty('soul0c.alpha', 1)

        if getProperty('cfobj.x') > 800 and getProperty('cfobj.x') < 1400 and camPos == 0 then
            cameraFlash('other', 'FFFFFF', 1)
            playSound('shot')
            runTimer('sayCheese2', 2)
            runTimer('punches', getRandomInt(6, 10))
            runTimer('hideLaugh', getRandomInt(5, 15)) --HLTIME
            runTimer('lightLaugh', getRandomInt(10, 15)) --LLTIME
        else
            lightsDown()
            cancelTimer('changeSound')
            setProperty('soul0c.alpha', 0)
        end

        
    end

    if tag == 'sayCheese2' then
         
        setProperty('soul0c.alpha', 0)
        runTimer('sayCheese', getRandomInt(23, 30) * difficulty)
    end

    if tag == 'dieStep' and soul3 then
        soulPos = soulPos + 1

        if soulPos < 7 then
            

            if soulPos == 1 then
                setTextString('site_t', '1-A')
            elseif soulPos == 2 then
                setTextString('site_t', '2-A')
            elseif soulPos == 3 then
                setTextString('site_t', '1-B')
            elseif soulPos == 4 then
                setTextString('site_t', '2-B')
            elseif soulPos == 5 then
                setTextString('site_t', '1-C')
            elseif soulPos == 6 then
                setTextString('site_t', '2-C')
            end


        elseif soulPos == 7 then
            runTimer('dieCount', 2)
        end

        runTimer('dieStep', getRandomInt(7, 15) * difficulty)
    end

    if tag == 'soul3anim' then
        setProperty('soul3.angle', getRandomFloat(-1, 1))
    end

    if tag == 'canRestart' then
        canRestart = true
    end

    if tag == 'endGame' then
        loadSong('begin')
    end

    if tag == 'rare' then
        playSound('rare', 0.65 * volume)
    end

    if tag == 'dieRepeat' and not hiding and not jumpscared and soul3 then
        onJumpscare('closet')
    end

    if tag == 'dieCount' and soul3 then
        doTweenAlpha('soul3', 'soul3', 0.7, 1, 'expoOut')
        cancelTimer('ratEat')
        cancelTimer('changeSound')
        cancelTimer('sayCheese')
        playSound('imhere', 0.4 * volume)
        runTimer('dieKill1', 5)
    end

    if tag == 'dieKill1' and soul3 then
        runTimer('dieRepeat', 0.2, 14)
        runTimer('dieKill2', 3)
    end

    if tag == 'dieKill2' and not jumpscared and soul3 then

        playSound('')
        soulPos = 1
        setTextString('site_t', '1-A')

        if (tasks * 100 / needTasks) <= 40 then
            runTimer('ratEat', getRandomInt(12, 30) * difficulty)

        elseif (tasks * 100 / needTasks) > 40 and (tasks * 100 / needTasks) <= 70 then
            runTimer('ratEat', getRandomInt(12, 25) * difficulty)

        elseif (tasks * 100 / needTasks) > 70 then
            runTimer('ratEat', getRandomInt(6, 12) * difficulty)
        end

        doTweenAlpha('soul3', 'soul3', 0, 1, 'expoIn')

        runTimer('sayCheese', getRandomInt(23, 30) * difficulty)
        runTimer('changeSound', getRandomInt(15, 30) * difficulty)
    end

    

    

    if tag == 'changeSound' and soul2 then
        cancelTimer('sayCheese')
        cancelTimer('hideLaugh')
        cancelTimer('lightLaugh')
        cancelTimer('punches')

        playSound('lightsdown', 0.1)

        needMusic = getRandomInt(1, 4, musicFile)
        setProperty('blackScreen.alpha', 1)
        doTweenAlpha('b', 'blackScreen', 0, 3, 'bounceInOut')
        runTimer('killSound', 8 * difficulty * ttk)
        runTimer('sayCheese', getRandomInt(23, 30) * difficulty)
        runTimer('punches', getRandomInt(5, 10))
    end





    if tag == 'ratEat' and soul1 then
        rat = false
        setProperty('cheeseActive.alpha', 0.05)
        runTimer('ratKill', 10 * ttk)
    end

    if tag == 'ratKill' and soul1 then
        onJumpscare('cheese')
    end

    if tag == 'killSound' and soul2 then

        if musicFile ~= needMusic then
            onJumpscare('music')
        elseif musicFile == needMusic then
            runTimer('changeSound', getRandomInt(15, 30) * difficulty)
            runTimer('hideLaugh', getRandomInt(6, 15)) --HLTIME
            runTimer('lightLaugh', getRandomInt(10, 15)) --LLTIME
        end
    end

    if tag == 'killSound2' and musicFile ~= needMusic and soul2 then
        onJumpscare('music')
    end

    if tag == 'newTask' then

        playSound('scrollMenu', 1 * volume)

        getRandomItem(1)

        if tasks > 5 then
            getRandomItem(2)
        end

        if tasks > 8 then
            getRandomItem(3)
        end
    end

    if tag == 'nymphaea' then
        if nymphaea < 10 then
            nymphaea = nymphaea + 1
            setTextString('nymphaea_t', 'Time: '..nymphaea)
        elseif nymphaea == 10 then
            setTextString('nymphaea_t', 'Done')
        end
    end

    if tag == 'lilium' then

        if lilium < 15 then
            lilium = lilium + 1
            setTextString('lilium_t', 'Time: '..lilium)
        elseif lilium == 15 then
            setTextString('lilium_t', 'Done')
        end
    end

    if tag == 'sativus' then

        if sativus < 15 then
            sativus = sativus + 1
            setTextString('sativus_t', 'Time: '..sativus)
        elseif sativus == 15 then
            setTextString('sativus_t', 'Done')
        end
    end

    if tag == 'cooldown' then
        cooldown = false
    end

    if tag == 'warn' then
        playSound('warn', 0.8 * volume, 'warn')
        setProperty('warn.alpha', 1)
        doTweenAlpha('warn', 'warn', 0, 0.15, 'bounceInOut')
        runTimer('warnAnim2', 0.25)
        warn = true
    end


    if tag == 'warnAnim2' then
        stopSound('warn')
        playSound('warn', 0.8 * volume, 'warn')
        setProperty('warn.alpha', 1)
        doTweenAlpha('warn', 'warn', 0, 0.15, 'bounceInOut')
        runTimer('warnAnim2', 0.25)
    end

    if tag == 'music' then

        if night ~= 5 then
            playMusic('office', 0.2 * volume, true)
        elseif night == 5 then
            playMusic('custom', 0.2 * volume, true)
        end
    end

    if tag == 'canCam' then
        canCam = true
    end

    if tag == 'light' then
        setProperty('light.alpha', 0)
        doTweenAlpha('light', 'light', 1, 0.2, 'circOut')
        runTimer('light', getRandomFloat(0.1, 3))
    end
end







function onTweenCompleted(tag)

    if tag == 'fog1' then
        setProperty('fog1.x', 0)
        setProperty('fog2.x', 4000)
        doTweenX('fog1', 'fog1', -4000, 70)
        doTweenX('fog2', 'fog2', 0, 70)
    end

    if tag == 'hiding1' then
        hiding = true
        playSound('close'..getRandomInt(1, 2), 0.3)
    end

    if tag == 'hiding2' then
        hiding = false
        playSound('close'..getRandomInt(1, 2), 0.3)
    end
end






function getItem(name)
    playSound('inventory', 1 * volume)
    item = name
    setProperty('nymphaea.alpha', 0)
    setProperty('lilium.alpha', 0)
    setProperty('sativus.alpha', 0)
    setProperty('cheese.alpha', 0)

    setProperty(name..'.alpha', 1)
    setProperty(name..'.scale.x', 0.6)
    setProperty(name..'.scale.y', 0.6)
    startTween('item', name..'.scale', {x = 0.5, y = 0.5}, 0.5, {ease = 'backInOut'})
end








function getRandomItem(itemNum)
    ranNum = getRandomInt(1, 3)

    if itemNum == 1 then
        if ranNum == 1 then
            needItem1 = 'lilium'
            makeLuaSprite('needItem1', 'hailey/lilium', 2200, 320)
            scaleObject('needItem1', 0.5, 0.5)
            addLuaSprite('needItem1')
            setProperty('needItem1.alpha', 0.3)
        elseif ranNum == 2 then
            needItem1 = 'nymphaea'
            makeLuaSprite('needItem1', 'hailey/nymphaea', 2200, 320)
            scaleObject('needItem1', 0.5, 0.5)
            addLuaSprite('needItem1')
            setProperty('needItem1.alpha', 0.3)
        elseif ranNum == 3 then
            needItem1 = 'sativus'
            makeLuaSprite('needItem1', 'hailey/sativus', 2200, 320)
            scaleObject('needItem1', 0.5, 0.5)
            addLuaSprite('needItem1')
            setProperty('needItem1.alpha', 0.3)
        end

        setBlendMode('needItem1', 'add')

    elseif itemNum == 2 then
        if ranNum == 1 then
            needItem2 = 'lilium'
            makeLuaSprite('needItem2', 'hailey/lilium', 2200, 400)
            scaleObject('needItem2', 0.5, 0.5)
            addLuaSprite('needItem2')
            setProperty('needItem2.alpha', 0.3)
        elseif ranNum == 2 then
            needItem2 = 'nymphaea'
            makeLuaSprite('needItem2', 'hailey/nymphaea', 2200, 400)
            scaleObject('needItem2', 0.5, 0.5)
            addLuaSprite('needItem2')
            setProperty('needItem2.alpha', 0.3)
        elseif ranNum == 3 then
            needItem2 = 'sativus'
            makeLuaSprite('needItem2', 'hailey/sativus', 2200, 400)
            scaleObject('needItem2', 0.5, 0.5)
            addLuaSprite('needItem2')
            setProperty('needItem2.alpha', 0.3)
        end

        setBlendMode('needItem2', 'add')

    elseif itemNum == 3 then
        if ranNum == 1 then
            needItem3 = 'lilium'
            makeLuaSprite('needItem3', 'hailey/lilium', 2200, 480)
            scaleObject('needItem3', 0.5, 0.5)
            addLuaSprite('needItem3')
            setProperty('needItem3.alpha', 0.3)
        elseif ranNum == 2 then
            needItem3 = 'nymphaea'
            makeLuaSprite('needItem3', 'hailey/nymphaea', 2200, 480)
            scaleObject('needItem3', 0.5, 0.5)
            addLuaSprite('needItem3')
            setProperty('needItem3.alpha', 0.3)
        elseif ranNum == 3 then
            needItem3 = 'sativus'
            makeLuaSprite('needItem3', 'hailey/sativus', 2200, 480)
            scaleObject('needItem3', 0.5, 0.5)
            addLuaSprite('needItem3')
            setProperty('needItem3.alpha', 0.3)
        end

        setBlendMode('needItem3', 'add')
    end
end





function checkItems()
    if needItem1 == '' and needItem2 == '' and needItem3 == '' then
        tasks = tasks + 1

        if tasks ~= needTasks then
        runTimer('newTask', getRandomInt(3, 6))


        elseif tasks == needTasks then
            cancelTimer('warn')
            cancelTimer('warnAnim1')
            cancelTimer('warnAnim2')
            cancelTimer('cooldown')
            cancelTimer('ratEat')
            cancelTimer('ratKill')
            cancelTimer('changeSound')
            cancelTimer('killSound')
            cancelTimer('killSound2')
            stopSound('empty')
            stopSound(_)
            cooldown = true

            playSound('win', 1)
            doTweenAlpha('hiding', 'hiding', 1, 2)

            makeLuaText('win', "congratulations!", 1280, 0, 300)
            setTextSize('win', 42)
            setObjectCamera('win', 'other')
            setTextFont('win', 'ROCK.TTF')
            setProperty('win.antialiasing', true)
            setTextBorder('win', 0)
            addLuaText('win', true)
            setProperty('win.scale.x', 1.3)
            setProperty('win.scale.y', 1.2)
            startTween('win', 'gameover.scale', {x = 1.1, y = 1}, 0.3, {ease = 'linear'})

            runTimer('endGame', 2.5)
        end
    end
end






function onJumpscare(who)
    soul1 = false
    soul2 = false
    soul3 = false
    soul0 = false

    jumpscared = true
    runTimer('canRestart', 4)
    cancelTimer('dieCount')
    cancelTimer('dieKill1')
    cancelTimer('dieKill2')
    cancelTimer('ratEat')
    cancelTimer('ratKill')
    cancelTimer('changeSound')
    cancelTimer('killSound')
    cancelTimer('killSound2')

    playSound('scream-2', 1, 'scream')
    cancelTimer('warn')
    cancelTimer('warnAnim1')
    cancelTimer('warnAnim2')
    stopSound('warn')
    stopSound('empty')
    stopSound(_)

    makeLuaSprite('red', '')
    makeGraphic('red', 1280, 720, 'FF0000')
    setObjectCamera('red', 'other')
    addLuaSprite('red', true)
    doTweenColor('red', 'red', '000000', 3, 'expoIn')

    makeLuaText('gameover', "YOU'RE DEAD", 1280, 0, 300)
    setTextSize('gameover', 42)
    setObjectCamera('gameover', 'other')
    setTextFont('gameover', 'ROCK.TTF')
    setProperty('gameover.antialiasing', true)
    setTextBorder('gameover', 0)
    addLuaText('gameover', true)
    setProperty('gameover.scale.x', 1.2)
    setProperty('gameover.scale.y', 1.2)
    startTween('goScale', 'gameover.scale', {x = 1, y = 1}, 0.3, {ease = 'linear'})
    doTweenColor('goColor', 'gameover', 'FF0000', 3, 'expoIn')


    makeLuaText('who', who, 1280, 0, 650)
    setTextSize('who', 24)
    setObjectCamera('who', 'other')
    setTextFont('who', 'ROCC.TTF')
    setProperty('who.antialiasing', true)
    setTextBorder('who', 0)
    addLuaText('who', true)
    setProperty('who.alpha', 0)
    doTweenAlpha('who', 'who', 0.15, 6, 'expoIn')

    makeLuaText('restart', 'click to restart', 1280, 0, 600)
    setTextSize('restart', 24)
    setObjectCamera('restart', 'other')
    setTextBorder('restart', 0)
    setTextFont('restart', 'ROCC.TTF')
    setProperty('restart.antialiasing', true)
    addLuaText('restart', true)
    setProperty('restart.alpha', 0)
    doTweenAlpha('restart', 'restart', 0.5, 6, 'expoIn')

    makeLuaSprite('blood', 'hailey/bloodEffect')
    setObjectCamera('blood', 'other')
    addLuaSprite('blood', true)
    setBlendMode('blood', 'add')
    doTweenAlpha('blood', 'blood', 0, 6, 'expoInOut')

    cancelTimer('cooldown')
    cooldown = true
end



function lightsDown()
    volume = 0
    lights = false
    stopSound('sativus')
    stopSound('lilium')
    stopSound('nymphaea')
    setTextString('lightreset', 'reconnect services')
    setSoundVolume('empty', 0)
    setProperty('bs.alpha', 1)
end



function mouseOverlaps(obj, camera)

    if camera == 'other' then
        mX = getMouseX(camera)
        mY = getMouseY(camera)
    elseif camera == 'game' then
        mX = getMouseX('game') + getProperty('camFollow.x') - 630
        mY = getMouseY('game') + getProperty('camFollow.y') - 360
    end

    x = getProperty(obj..'.x')
    y = getProperty(obj..'.y')
    width = getProperty(obj..'.width')
    height = getProperty(obj..'.height')
    return (mX > x) and (mX < x + width) and (mY > y) and (mY < y + height)
end


function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end