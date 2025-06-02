local shaderName = "perspective"

function onCreate()
    name = getDataFromSave('thwlTests', 'username')

    camPos = 0
    canCam = true
    warn = false
    warn2 = false
    hiding = false
    cooldown = false

    nymphaea = -1
    lilium = -1
    sativus = -1

    item = ''
    tasks = 0
    needTasks = 1

    tutorial = false

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

    flash = false
    power = 20
    volume = 1
    filevolume = 1
    lights = true
    repairing = false
    distractCd = true

    night = getDataFromSave('thwlTests', 'night')

    alert = true -- warn
    soul1 = true -- cheese/fish
    soul2 = true -- song
    soul3 = true -- closet thing
    soul0 = true -- camera girl
    ultimate = true
    ultiDiff = 0.7

    altalert = false
    soul4 = false -- mini ghost
    soul5 = false -- cat
    cathp = 0
    ttk = 1

    alertlevel = 1
    fishlevel = 1
    musiclevel = 1
    doorlevel = 1
    cameralevel = 1
    ghostlevel = 1
    catlevel = 1


    if night == 1 then
        alert = false
        ultimate = false
        needTasks = 12
        difficulty = 2.4
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
        doorlevel = 0.6
        difficulty = 0.8
        runTimer('rare', getRandomInt(120, 220))
    elseif night == 5 then
        soul3 = false
        ttk = 1.5
        needTasks = 12
        difficulty = 0.5
        runTimer('rare', getRandomInt(100, 220))
        filevolume = 0
        voice = getRandomInt(1, 4)
        precacheSound('her/voice'..voice)
        playSound('her/voice'..voice, 0.7)
    elseif night == 6 then
        difficulty = 1
        needTasks = 16
        
        alert = false
        soul0 = false
        soul1 = false
        soul2 = false
        soul3 = false
        soul5 = false
        ultimate = false
        filevolume = 0


        alertlevel = getDataFromSave('thwlTests', 'alertlevel')
        fishlevel = getDataFromSave('thwlTests', 'fishlevel')
        musiclevel = getDataFromSave('thwlTests', 'musiclevel')
        doorlevel = getDataFromSave('thwlTests', 'doorlevel')
        cameralevel = getDataFromSave('thwlTests', 'cameralevel')
        catlevel = getDataFromSave('thwlTests', 'catlevel')

        if alertlevel < 2 then
            altalert = true
            alert = true
        end

        if fishlevel < 2 then
            soul1 = true
        end

        if musiclevel < 2 then
            soul2 = true
        end

        if doorlevel < 2 then
            soul3 = true
        end

        if cameralevel < 2 then
            soul0 = true
        end

        if catlevel < 2 then
            soul5 = true
        end

    end
    


    

    jumpscared = false
    totalScore = string.format("%.0f", 1500 - ((alertlevel * 125) + (fishlevel * 125) + (musiclevel * 125) + (doorlevel * 125) + (cameralevel * 125) + (catlevel * 125)))



    precacheMusic('music')
    precacheMusic('office')
    precacheMusic('custom')
    precacheSound('empty')
    precacheSound('song1')
    precacheSound('song2')
    precacheSound('song3')
    precacheSound('song4')

    if night ~= 5 then
        runTimer('music')
    else
        runTimer('music', 2)
    end
    setProperty('cameraSpeed', 10)

	makeLuaSprite('bg', 'hailey/bg2')
    setScrollFactor('bg', 0, 0)
	addLuaSprite('bg')
    setProperty('bg.alpha', 0.3)

    if night ~= 6 then
        makeLuaSprite('office', 'hailey/bg')
    elseif night == 6 then
        makeLuaSprite('office', 'hailey/bga')
    end
    setProperty('office.antialiasing', false)
    addLuaSprite('office')

    makeLuaSprite('geneLight', 'hailey/light4', 300)
    setProperty('geneLight.antialiasing', false)
    setBlendMode('geneLight', 'add')
    addLuaSprite('geneLight')

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

    if night ~= 6 then
        makeLuaSprite('thing', 'hailey/light2', 2320, 320)
    elseif night == 6 then
        makeLuaSprite('thing', 'hailey/light3', 2320, 320)
    end
    setBlendMode('thing', 'add')
    addLuaSprite('thing')

    makeLuaSprite('soul3', 'hailey/soul3anim', 2200, 70)
    setBlendMode('soul3', 'add')
    setProperty('soul3.alpha', 0)
    addLuaSprite('soul3')

    makeLuaSprite('soul5', 'hailey/soul5', 2200, 90)
    setBlendMode('soul5', 'add')
    setProperty('soul5.alpha', 0.4)
    scaleObject('soul5', 0.8, 0.8)
    if soul5 then
        addLuaSprite('soul5')
    end

    runTimer('soul3anim', 0.3, 99999)


    if soul3 then
    makeLuaSprite('site', 'hailey/site', 1670, 242)
    setBlendMode('site', 'add')
    setProperty('site.alpha', 1)
    addLuaSprite('site')

    makeLuaText('site_t', 'RM1-A', 250, 1727, 274)
    setTextSize('site_t', 22)
    setObjectCamera('site_t', 'game')
    setTextFont('site_t', 'ocr.ttf')
    setProperty('site_t.antialiasing', true)
    setTextAlignment('site_t', 'left')
    setScrollFactor('site_t', 1, 1)
    setTextBorder('site_t', 0)
    addLuaText('site_t', true)

    makeLuaText('distract', 'distract', 230, 1632, 347)
    setTextSize('distract', 20)
    setObjectCamera('distract', 'game')
    setTextFont('distract', 'ocr.ttf')
    setProperty('distract.antialiasing', true)
    setScrollFactor('distract', 1, 1)
    setTextBorder('distract', 0)
    addLuaText('distract', true)
    end

    makeLuaSprite('warn', 'hailey/warn', 1825, 410)
    setBlendMode('warn', 'add')
    setProperty('warn.alpha', 0)
    addLuaSprite('warn')

    makeLuaSprite('warn2', 'hailey/warn2', 1825, 410)
    setBlendMode('warn2', 'add')
    setProperty('warn2.alpha', 0)
    addLuaSprite('warn2')


    if night < 5 then
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
    elseif night == 6 then
        makeLuaSprite('light', 'hailey/light')
        setBlendMode('light', 'add')
        addLuaSprite('light', true)

        makeLuaSprite('fog1', 'hailey/coldfog')
        setBlendMode('fog1', 'add')
        setProperty('fog1.alpha', 0.2)
        setScrollFactor('fog1', 1, 0)
        addLuaSprite('fog1')

        makeLuaSprite('fog2', 'hailey/coldfog', 4000)
        setBlendMode('fog2', 'add')
        setProperty('fog2.alpha', 0.2)
        setScrollFactor('fog2', 1, 0)
        addLuaSprite('fog2')

        doTweenX('fog1', 'fog1', -4000, 70)
        doTweenX('fog2', 'fog2', 0, 70)
    end



    makeLuaSprite('hide_h', '', 3200, 50)
    makeGraphic('hide_h', 520, 520, '888888')

    makeLuaSprite('sound_h', '', 2720, 350)
    makeGraphic('sound_h', 250, 250, '888888')

    if soul2 then
    makeLuaText('iwanna', 'change to '..needMusic..'.wav', 130, 2775, 370)
    setTextSize('iwanna', 20)
    setObjectCamera('iwanna', 'game')
    setScrollFactor('iwanna', 1, 1)
    setTextFont('iwanna', 'ocr.ttf')
    setProperty('iwanna.antialiasing', true)
    setTextBorder('iwanna', 0)
    setProperty('iwanna.scale.x', 1.1)
    addLuaText('iwanna', true)
    end

    makeLuaSprite('musicicon', 'hailey/music', 2695, 320)
    setBlendMode('musicicon', 'add')
    setProperty('musicicon.alpha', 1)
    addLuaSprite('musicicon')

    makeLuaText('file', 'song'..musicFile..'.wav', 250, 2720, 523)
    setTextSize('file', 20)
    setObjectCamera('file', 'game')
    setScrollFactor('file', 1, 1)
    setTextFont('file', 'ocr.ttf')
    setProperty('file.antialiasing', true)
    setTextBorder('file', 0)
    setProperty('file.scale.x', 1.1)
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

    if night ~= 6 then
        makeLuaSprite('cheeseActive', 'hailey/cheese', 360, 1260)
    elseif night == 6 then
        makeLuaSprite('cheeseActive', 'hailey/fish', 360, 1260)
    end
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
    

    if not getDataFromSave('thwlTests', name..'tutorial') then

    setDataFromSave('thwlTests', name..'tutorial', true) 

    tutorial = true

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
    setObjectCamera('hiding', 'hud')
    setProperty('hiding.alpha', 0)
    addLuaSprite('hiding')

    makeLuaSprite('zone', '', 900, 20)
    makeGraphic('zone', 500, 20, 'FFFFFF')

    makeLuaSprite('cfobj', '', 0, 300)
    makeGraphic('cfobj', 20, 20, 'FFFFFF')

    if soul1 then
        runTimer('ratEat', 30 * fishlevel * difficulty)
    end

    if soul2 then
        runTimer('changeSound', getRandomInt(40, 50) * musiclevel)
    end

    if soul3 then
        runTimer('dieStep', getRandomInt(8, 15) * doorlevel * difficulty)
    end

    if soul0 then
        runTimer('sayCheese', getRandomInt(23, 30) * cameralevel * difficulty)
    end

    if soul5 then
        runTimer('catAppear', getRandomInt(16, 36) * catlevel)
    end

    runTimer('newTask', getRandomInt(3, 6))
    runTimer('warn', getRandomInt(15, 25) * difficulty)
    
    if ultimate then
        runTimer('punches', 7)
    end


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

    if night > 4 then
        makeLuaSprite('flash', 'hailey/flash', 1000, 0)
        setBlendMode('flash', 'add')
        scaleObject('flash', 1.3, 1.3)
        addLuaSprite('flash', true)
    end

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

    if night ~= 6 then
        makeLuaSprite('cheese', 'hailey/cheese')
    elseif night == 6 then
        makeLuaSprite('cheese', 'hailey/fish')
    end
    setObjectCamera('cheese', 'other')
    scaleObject('cheese', 0.5, 0.5)
    addLuaSprite('cheese')
    setProperty('cheese.alpha', 0)

    makeLuaSprite('dark', 'hailey/dark')
    setObjectCamera('dark', 'game')
    setScrollFactor('dark', 0, 0)
    addLuaSprite('dark', true)

    makeLuaText('night', 'Night '..getDataFromSave('thwlTests', 'night'), 0, 80, 100)
    setTextSize('night', 20)
    setTextBorder('night', 0)
    setProperty('night.alpha', 0.6)
    setObjectCamera('night', 'game')
    setScrollFactor('night', 1, 0)
    setTextFont('night', 'ROCK.TTF')
    setProperty('night.antialiasing', true)
    addLuaText('night')

    makeLuaSprite('pfp', 'hailey/chars/'..getDataFromSave('thwlTests', name..'-pfp'), 80, 550)
    setScrollFactor('pfp', 1, 0)
    addLuaSprite('pfp', true)
    scaleObject('pfp', 0.4, 0.4)
    setProperty('pfp.alpha', 0.6)

    makeLuaText('name', name, 0, 80, 600)
    setTextSize('name', 20)
    setTextBorder('name', 0)
    setProperty('name.alpha', 0.6)
    setObjectCamera('name', 'game')
    setScrollFactor('name', 1, 0)
    setTextFont('name', 'ROCK.TTF')
    setProperty('name.antialiasing', true)
    addLuaText('name')

    makeLuaText('flashtxt', 'Flashlight: '..power, 0, 80, 570)
    setTextSize('flashtxt', 20)
    setTextBorder('flashtxt', 0)
    setProperty('flashtxt.alpha', 0.6)
    setObjectCamera('flashtxt', 'game')
    setScrollFactor('flashtxt', 1, 0)
    setTextFont('flashtxt', 'ROCK.TTF')
    setProperty('flashtxt.antialiasing', true)
    addLuaText('flashtxt')

    if night == 6 then
        setTextString('night', 'Custom Night: '..totalScore..'P')
    end

    if night < 5 then
        setTextString('flashtxt', 'No Flashlight')
        setProperty('flashtxt.alpha', 0.2)
    end

    makeLuaText('tasks', '?', 300, 0, 130)
    setTextSize('tasks', 20)
    setTextAlignment('tasks', 'left')
    setObjectCamera('tasks', 'game')
    setScrollFactor('tasks', 1, 0)
    setTextBorder('tasks', 0)
    setProperty('tasks.alpha', 0.6)
    setTextFont('tasks', 'ROCK.TTF')
    setProperty('tasks.antialiasing', true)
    addLuaText('tasks')

    if night >= 5 then
        makeLuaSprite('difficulty', '')
        setObjectCamera('difficulty', 'other')
        setBlendMode('difficulty', 'multiply')
        addLuaSprite('difficulty', true)
        setProperty('difficulty.alpha', 0.6)
        if night == 5 then
            makeGraphic('difficulty', 1290, 730, '440022')
        elseif night == 6 then
            makeGraphic('difficulty', 1290, 730, '113399')
        end
    end

    makeLuaSprite('bs', '')
    makeGraphic('bs', 4000, 4000, '000000')
    addLuaSprite('bs', true)
    setProperty('bs.alpha', 0)

    makeLuaText('lightreset', 'disconnect services', 200, 180, 400)
    setTextSize('lightreset', 32)
    setTextBorder('lightreset', 0)
    setTextColor('lightreset', '00FF00')
    setTextFont('lightreset', 'ocr.ttf')
    setProperty('lightreset.antialiasing', true)
    addLuaText('lightreset', true)
    setObjectCamera('lightreset', 'game')
    setScrollFactor('lightreset', 1, 1)
    setProperty('lightreset.scale.x', 1.1)

    makeLuaSprite('blackScreen', '')
    makeGraphic('blackScreen', 1280, 720, '000000')
    setObjectCamera('blackScreen', 'other')
    addLuaSprite('blackScreen', true)



    makeLuaText('cursor', '°')
    setTextSize('cursor', 30)
    setObjectCamera('cursor', 'hud')
    setTextBorder('cursor', 0)
    addLuaText('cursor', true)
    setTextFont('cursor', 'ROCC.TTF')
    setProperty('cursor.antialiasing', true)

    makeLuaText('help', '...', 400)
    setTextSize('help', 24)
    setObjectCamera('help', 'hud')
    setTextAlignment('help', 'left')
    setTextBorder('help', 0)
    addLuaText('help', true)
    setTextFont('help', 'ROCC.TTF')
    setProperty('help.antialiasing', true)

end





function onUpdate()


    if keyboardJustPressed('P') then
        loadSong('menu')
    end

    if keyboardJustPressed('R') then
        restartSong()
    end


    if soul5 then
        setProperty('soul5.y', 90 + getRandomFloat(-3, 3))
        setProperty('soul5.x', 2200 + getRandomFloat(-3, 3))

        if mouseOverlaps('soul5', 'game') and flash then
            if cathp == 0.5 then
                cancelTimer('catKill')
                playSound('gone')
            end
            cathp = cathp - 0.5
        end
    end

    if night > 4 then

        if flash then
            doTweenX('flashx', 'flash', getProperty('camFollow.x') + getMouseX('other') - 780, 1, 'expoOut')
            doTweenY('flashy', 'flash', getProperty('camFollow.y') + getMouseY('other') - 500, 1, 'expoOut')
            setProperty('flash.alpha', getRandomFloat(0.3, 0.7))


            if power >= 1 then
                power = power - 0.006
            elseif power < 1 then
                flash = false
            end
        else
            setProperty('flash.alpha', 0)
        end

        setTextString('flashtxt', 'Flashlight: '..math.floor(power))
    end

    if soul5 then
        setProperty('soul5.alpha', (cathp * 0.5) / 30)
    end


    if keyboardJustPressed('SHIFT') and power >= 1 and night > 4 then
        stopSound('flash')
        playSound('flash', 0.4, 'flash')
        if flash then
            flash = false
        else
            flash = true
        end
    end

    doTweenX('name', 'name', getProperty('camFollow.x') - 460, 0.6, 'expoOut')
    doTweenX('pfp', 'pfp', getProperty('camFollow.x') - 550, 0.6, 'expoOut')
    doTweenX('night', 'night', getProperty('camFollow.x') - 550, 0.6, 'expoOut')
    doTweenX('tasks', 'tasks', getProperty('camFollow.x') - 550, 0.6, 'expoOut')
    doTweenX('flashtxt', 'flashtxt', getProperty('camFollow.x') - 460, 0.6, 'expoOut')

    setShaderFloat("perspective", "iTime", os.clock())

    setProperty('cfobj.x', getProperty('camFollow.x') - 620)

    setProperty('soul3.y', 70 + (getProperty('soul3.angle') * 2))
    setProperty('soul3.x', 2200 + getProperty('soul3.angle'))

    setProperty('geneLight.alpha', getRandomFloat(0.4, 1))
    setProperty('file.alpha', getRandomFloat(0.7, 1))
    setProperty('iwanna.alpha', getRandomFloat(0.7, 1))
    setProperty('musicicon.alpha', getRandomFloat(0.7, 1))
    setProperty('thing.alpha', getRandomFloat(0.3, 1))
    setProperty('site.alpha', getRandomFloat(0.7, 1))
    setProperty('site_t.alpha', getProperty('site.alpha'))

    if night < 5 then
        changeDiscordPresence("Hailey's Fate | Harvest "..night, 'Tasks: '..tasks..'/'..needTasks, '', true, 0, 'normal')
    elseif night == 5 then
        changeDiscordPresence("Hailey's Fate | Harvest "..night, 'Tasks: '..tasks..'/'..needTasks, '', true, 0, 'hard')
    elseif night == 6 then
        changeDiscordPresence("Hailey's Fate | Custom Harvest: "..totalScore.."P", 'Tasks: '..tasks..'/'..needTasks, '', true, 0, 'custom')
    end

    if night == 5 and lights then
        setProperty('camGame.x', getRandomInt(-1, 1))
    end

    setTextString('iwanna', 'change to '..needMusic..'.wav')
    setTextString('tasks', 'Tasks: '..tasks..' / '..needTasks)
    setProperty('bg.flipY', getRandomBool(50))
    setProperty('bg.flipX', getRandomBool(50))
    setProperty('static.flipY', getRandomBool(50))
    setProperty('static.flipX', getRandomBool(50))

    setProperty('cursor.x', getMouseX('other'))
    setProperty('cursor.y', getMouseY('other'))

    doTweenX('helpx', 'help', getMouseX('other') + 20, 0.5, 'expoOut')
    doTweenY('helpy', 'help', getMouseY('other'), 0.5, 'expoOut')

    if mouseOverlaps('lilium_h', 'game') then
        setTextString('help', "Lilium Generator (7,5s)")
    elseif mouseOverlaps('nymphaea_h', 'game') then
        setTextString('help', "Nymphaea Generator (10s)")
    elseif mouseOverlaps('sativus_h', 'game') then
        setTextString('help', "Sativus Generator (19,5s)")
    elseif needItem1 ~= '' and mouseOverlaps('needItem1', 'game') then
        setTextString('help', "Need <"..needItem1.."> material.")
    elseif needItem2 ~= '' and mouseOverlaps('needItem2', 'game') then
        setTextString('help', "Need <"..needItem2.."> material.")
    elseif needItem3 ~= '' and mouseOverlaps('needItem3', 'game') then
        setTextString('help', "Need <"..needItem3.."> material.")
    else
        if not tutorial then
            setTextString('help', "")
        end
    end







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

        setProperty('file.alpha', 0)
        setProperty('iwanna.alpha', 0)
        setProperty('musicicon.alpha', 0)
        setTextString('file', 'song'..musicFile..'.wav')
        setProperty('file.x', 2720 + 10)
        doTweenX('filex', 'file', 2720, 0.5, 'expoOut')
        runTimer('killSound2', 4 * musiclevel * difficulty)
        stopSound('musicFile')
        playSound('song'..musicFile, 0.3 * filevolume, 'musicFile', true)
    end


    if camPos == 1 and mouseClicked('left') and not hiding and not cooldown then
        if item == 'cheese' and getProperty('cheeseActive.alpha') < 1 then
            playSound('inventory', 1 * volume)
            setProperty('cheeseActive.alpha', 1)
            setProperty('cheese.alpha', 0)
            cancelTimer('ratKill')

            if (tasks * 100 / needTasks) <= 40 then
                runTimer('ratEat', getRandomInt(30, 45) * fishlevel * difficulty)
            elseif (tasks * 100 / needTasks) > 40 and (tasks * 100 / needTasks) <= 70 then
                runTimer('ratEat', getRandomInt(18, 25) * fishlevel * difficulty)
            elseif (tasks * 100 / needTasks) > 70 then
                runTimer('ratEat', getRandomInt(8, 12) * fishlevel * difficulty)
            end

            item = ''
        end
    end




    if soul3 and mouseOverlaps('site', 'game') and mouseClicked('left') and not hiding and not cooldown then
        if distractCd and soulPos ~= 7 then
        playSound('tv', 0.5)
        playSound('taunt', 0.5)
        distractCd = false
        soulPos = soulPos - 4
        runTimer('distractCd', 24)
        setTextString('site_t', 'RM?-?')
        setTextString('distract', 'wait...')
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

    if mouseOverlaps('warn_h', 'game') and not hiding and not cooldown then
        if warn and mouseClicked('left') then
            playSound('alarm', 1 * volume)
            cancelTimer('warnAnim1')
            cancelTimer('warnAnim2')
            setProperty('warn.alpha', 0)
            warn = false
            runTimer('warn', getRandomInt(20, 30) * difficulty * alertlevel)
        elseif warn2 and flash then
            playSound('alarm', 1 * volume)
            cancelTimer('warnAnim1_2')
            cancelTimer('warnAnim2_2')
            setProperty('warn2.alpha', 0)
            warn2 = false
            runTimer('warn', getRandomInt(10, 30) * difficulty * alertlevel)
        end
    end

    if mouseOverlaps('hide_h', 'game') and mouseClicked('left') and not hiding and not cooldown and camPos == 0 then
        camPos = 0
        doTweenAlpha('hiding1', 'hiding', 1, 0.5)
        cooldown = true
        runTimer('cooldown', 1)
        playSound('open'..getRandomInt(1, 2), 0.3 * volume)
    end

    if mouseOverlaps('nymphaea_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        if nymphaea == -1 then
            nymphaea = 10
            playSound('generator', 0.6 * volume)
            setTextString('nymphaea_t', 'Time: '..nymphaea)
            runTimer('nymphaea', 1, 10)
            playSound('nymphaea', 0.2 * volume, 'nymphaea')
        elseif nymphaea == 0 and item ~= 'nymphaea' then
            setTextString('nymphaea_t', '...')
            nymphaea = -1
            getItem('nymphaea')
        end
    end

    if mouseOverlaps('lilium_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        if lilium == -1 then
            playSound('generator', 0.6 * volume)
            lilium = 15
            setTextString('lilium_t', 'Time: '..lilium)
            runTimer('lilium', 0.5, 15)
            playSound('lilium', 0.3 * volume, 'lilium')
        elseif lilium == 0 and item ~= 'lilium' then
            setTextString('lilium_t', '...')
            lilium = -1
            getItem('lilium')
        end
    end

    if mouseOverlaps('sativus_h', 'game') and mouseClicked('left') and not hiding and not cooldown then
        if sativus == -1 then
            playSound('generator', 0.6 * volume)
            sativus = 15
            setTextString('sativus_t', 'Time: '..sativus)

            runTimer('sativus', 1.3, 15)
            playSound('sativus', 0.1 * volume, 'sativus')
        elseif sativus == 0 and item ~= 'sativus' then
            setTextString('sativus_t', '...')
            sativus = -1
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
        if camPos == 0 and canCam then
            cameraFlash('game', 'black', 0.3, true)
            canCam = false
            doTweenY('camFollow', 'camFollow', 360 + 720, 0.4, 'expoOut')
            camPos = 1
            runTimer('canCam', 0.41)
            playSound('move', 1)
        elseif camPos == 1 and canCam then
            cameraFlash('game', 'black', 0.3, true)
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

        setProperty('tasks.scale.x', 1.1)
        setProperty('tasks.scale.y', 1.1)
        startTween('taskssc', 'tasks.scale', {x = 1, y = 1}, 0.5, {ease = 'expoOut'})
        setProperty('tasks.alpha', 1)
        doTweenAlpha('tasksa', 'tasks', 0.6, 0.5, 'expoOut')

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

    if tag == 'catAppear' then
        cathp = 30
        runTimer('catAppear', getRandomInt(20, 36) * catlevel)
        runTimer('catKill', 9)
    end

    if tag == 'catKill' then
        onJumpscare('cat', 1)
    end


    if tag == 'distractCd' then
        distractCd = true
        setTextString('distract', 'distract')
    end

    if tag == 'tutorial' then
        tutorial = false
        removeLuaText('tuto_left')
        removeLuaText('tuto_right')
        removeLuaText('tuto_down')
        removeLuaText('tuto_reset')
        removeLuaText('tuto_menu')
    end

    if tag == 'punches' and not jumpscared and ultimate then

        if getRandomBool(40) then
        playSound('punchs')
        runTimer('punchesEnd', 1.6)
        runTimer('punches', getRandomInt(8, 15) * ultiDiff)

        else
            if lights then
                if getRandomBool(40) then
                cancelTimer('sayCheese')
                cancelTimer('ratEat')
                cancelTimer('changeSound')

                playSound('laugh'..getRandomInt(2, 3))
                runTimer('laughDead2', 3)
                runTimer('punches', getRandomInt(8, 15) * ultiDiff)
                else
                cancelTimer('sayCheese')

                playSound('laugh'..getRandomInt(0, 1))
                runTimer('laughDead1', 3)

                runTimer('punches', getRandomInt(6, 15) * ultiDiff)
                end
            else
                runTimer('punches', getRandomInt(8, 15) * ultiDiff)
            end
        end
    end


    if tag == 'punchesEnd' and not jumpscared and ultimate then
        runTimer('punchesRepeat', 0.5, 3)
        runTimer('punchesthing', 1.6)

        if camPos == 0 then
            onJumpscare('punches', 0)
        end

        runTimer('punches', getRandomInt(6, 15) * ultiDiff)
    end

    if tag == 'punchesRepeat' and not jumpscared and ultimate then
        if camPos == 0 then
            onJumpscare('punches', 0)
        end

        runTimer('punches', getRandomInt(6, 15) * ultiDiff) --PTIME
    end

    if tag == 'punchesthing' then
        playSound('gone')
    end




    if tag == 'laughDead1' and not jumpscared and ultimate then
        if hiding then
            playSound('gone')
        elseif not hiding then
            onJumpscare('left_laugh', 0)
        end
    end


    if tag == 'laughDead2' and not jumpscared and ultimate then

        if not lights then
            playSound('gone')
        elseif lights then
            onJumpscare('right_laugh', 0)
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
        setSoundVolume('musicFile', 0.3 * filevolume)

        if night == 5 then
            runTimer('ratEat', getRandomInt(8, 12))
            runTimer('changeSound', getRandomInt(15, 30) * musiclevel * difficulty)
        end
    end





    if tag == 'sayCheese' and soul0 then
        cancelTimer('changeSound')
        cancelTimer('punches')
        runTimer('punches', getRandomInt(6, 10) * ultiDiff)

        setProperty('soul0i.alpha', 1)
        playSound('saycheese', 0.7 * volume)
        runTimer('sayCheese1', 3)
        runTimer('changeSound', getRandomInt(15, 30) * musiclevel * difficulty) --CSTIME
    end

    if tag == 'sayCheese1' and lights then
        setProperty('soul0i.alpha', 0)
        setProperty('soul0c.alpha', 1)

        if getProperty('cfobj.x') > 800 and getProperty('cfobj.x') < 1400 and camPos == 0 then
            cameraFlash('other', 'FFFFFF', 1)
            playSound('shot')
            runTimer('sayCheese2', 2)
            
        else
            lightsDown()
            cancelTimer('changeSound')
            setProperty('soul0c.alpha', 0)
        end

        
    end

    if tag == 'sayCheese2' then
         
        setProperty('soul0c.alpha', 0)
        runTimer('sayCheese', getRandomInt(23, 30) * cameralevel * difficulty)
    end

    if tag == 'dieStep' and soul3 then
        soulPos = soulPos + 1

        if soulPos < 7 then
            

            if soulPos == 1 then
                setTextString('site_t', 'RM1-A')
            elseif soulPos == 2 then
                setTextString('site_t', 'RM2-A')
            elseif soulPos == 3 then
                setTextString('site_t', 'RM1-F')
            elseif soulPos == 4 then
                setTextString('site_t', 'RM2-F')
            elseif soulPos == 5 then
                setTextString('site_t', 'RM1-Z')
            elseif soulPos == 6 then
                setTextString('site_t', 'RM2-Z')
            end


        elseif soulPos == 7 then
            runTimer('dieCount', 2)
        end

        runTimer('dieStep', getRandomInt(7, 15) * doorlevel * difficulty)
    end

    if tag == 'soul3anim' then
        setProperty('soul3.angle', getRandomFloat(-1, 1))
    end


    if tag == 'endGame' then

        if night ~= 6 then
            setDataFromSave('thwlTests', name..'-night'..night, 1)
            flushSaveData('thwlTests')

            if night < 5 then
                setDataFromSave('thwlTests', 'night', getDataFromSave('thwlTests', 'night') + 1)
                loadSong('office')
            elseif night >= 5 then
                loadSong('menu')
            end
            
        elseif night == 6 then   

            if totalScore > getDataFromSave('thwlTests', name..'-night6') then
                setDataFromSave('thwlTests', name..'-night6', totalScore)  
            end
            
            flushSaveData('thwlTests')
            loadSong('menu')
        end

        
        
    end

    if tag == 'rare' then
        playSound('rare', 0.65 * volume)
    end

    if tag == 'dieRepeat' and not hiding and not jumpscared and soul3 then
        onJumpscare('closet', 0)
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
        runTimer('dieRepeat', 0.2, 9)
        runTimer('dieKill2', 2)
    end

    if tag == 'dieKill2' and not jumpscared and soul3 then

        playSound('gone')
        soulPos = 1
        setTextString('site_t', 'RM1-A')

        if (tasks * 100 / needTasks) <= 40 then
            runTimer('ratEat', getRandomInt(12, 30) * fishlevel * difficulty)

        elseif (tasks * 100 / needTasks) > 40 and (tasks * 100 / needTasks) <= 70 then
            runTimer('ratEat', getRandomInt(12, 25) * fishlevel * difficulty)

        elseif (tasks * 100 / needTasks) > 70 then
            runTimer('ratEat', getRandomInt(6, 12) * fishlevel * difficulty)
        end

        doTweenAlpha('soul3', 'soul3', 0, 1, 'expoIn')

        runTimer('sayCheese', getRandomInt(23, 30) * fishlevel * difficulty)
        runTimer('changeSound', getRandomInt(15, 30) * fishlevel * difficulty)
    end

    

    

    if tag == 'changeSound' and soul2 then
        cancelTimer('sayCheese')
        cancelTimer('punches')

        setSoundVolume('musicFile', 0)
        playSound('lightsdown', 0.1)

        needMusic = getRandomInt(1, 4, musicFile)
        setProperty('blackScreen.alpha', 1)
        doTweenAlpha('b', 'blackScreen', 0, 3, 'bounceInOut')
        runTimer('killSound', 8 * difficulty * ttk)
        runTimer('sayCheese', getRandomInt(23, 30) * cameralevel * difficulty)
        runTimer('punches', getRandomInt(6, 10) * ultiDiff)
    end





    if tag == 'ratEat' and soul1 then
        rat = false
        playSound('eat', 0.03 * volume)
        setProperty('cheeseActive.alpha', 0)
        runTimer('ratKill', 10 * ttk)
    end

    if tag == 'ratKill' and soul1 then
        onJumpscare('cheese', 0)
    end

    if tag == 'killSound' and soul2 then

        if musicFile ~= needMusic then
            onJumpscare('music', 0)

        elseif musicFile == needMusic then
            runTimer('changeSound', getRandomInt(15, 30) * musiclevel * difficulty)
            runTimer('punches', getRandomInt(6, 15) * ultiDiff) --HLTIME
        end
    end

    if tag == 'killSound2' and musicFile ~= needMusic and soul2 then
        onJumpscare('music', 0)
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
        if nymphaea > 1 then
            nymphaea = nymphaea - 1
            setTextString('nymphaea_t', 'Time: '..nymphaea)
        elseif nymphaea == 1 then
            nymphaea = 0
            setTextString('nymphaea_t', 'Done')
        end
    end

    if tag == 'lilium' then

        if lilium > 1 then
            lilium = lilium - 1
            setTextString('lilium_t', 'Time: '..lilium)
        elseif lilium == 1 then
            lilium = 0
            setTextString('lilium_t', 'Done')
        end
    end

    if tag == 'sativus' then

        if sativus > 1 then
            sativus = sativus - 1
            setTextString('sativus_t', 'Time: '..sativus)
        elseif sativus == 1 then
            sativus = 0
            setTextString('sativus_t', 'Done')
        end
    end

    if tag == 'cooldown' then
        cooldown = false
    end

    if tag == 'warn' and alert then
        if not warn and not warn2 then
            if not altalert then
                playSound('warn', 0.8 * volume, 'warn')
                setProperty('warn.alpha', 1)
                doTweenAlpha('warn', 'warn', 0, 0.15, 'bounceInOut')
                runTimer('warnAnim2', 0.25)
                warn = true
            else
                playSound('warn2', 0.8 * volume, 'warn')
                setProperty('warn2.alpha', 1)
                doTweenAlpha('warn2', 'warn2', 0, 0.15, 'bounceInOut')
                runTimer('warnAnim2_2', 0.25)
                runTimer('warn2Kill', 8)
                warn2 = true
            end
        end
    end


    if tag == 'warnAnim2_2' then
        stopSound('warn2')
        playSound('warn2', 0.8 * volume, 'warn2')
        setProperty('warn2.alpha', 1)
        doTweenAlpha('warn2', 'warn2', 0, 0.3, 'expoIn')
        runTimer('warnAnim2_2', 0.5)
    end

    if tag == 'warnAnim2' then
        stopSound('warn')
        playSound('warn', 0.8 * volume, 'warn')
        setProperty('warn.alpha', 1)
        doTweenAlpha('warn', 'warn', 0, 0.15, 'bounceInOut')
        runTimer('warnAnim2', 0.25)
    end

    if tag == 'warn2Kill' and warn2 then
        onJumpscare('warn2', 1)
    end

    if tag == 'music' then
        playSound('empty', 0.4 * volume, 'empty', true)
        doTweenAlpha('b', 'blackScreen', 0, 2)
        playSound('song1', 0.3 * filevolume, 'musicFile', true)

        if night == 5 then
            if not getDataFromSave('thwlTests', name..'music') then
                playMusic('custom', 0.15 * volume, true)
            else
                playMusic('office1', 0.5 * volume, true)
            end
        elseif night == 6 then
            if not getDataFromSave('thwlTests', name..'music') then
                playMusic('office', 0.15 * volume, true)
            else
                playMusic('custom1', 0.4 * volume, true)
            end
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
            cancelTimer('warnAnim1_2')
            cancelTimer('warnAnim2_2')
            cancelTimer('cooldown')
            cancelTimer('ratEat')
            cancelTimer('ratKill')
            cancelTimer('changeSound')
            cancelTimer('killSound')
            cancelTimer('killSound2')
            stopSound('empty')
            stopSound('musicFile')
            stopSound(_)
            cancelTimer('punches')
            volume = 0
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






function onJumpscare(who, num)
    soul1 = false
    soul2 = false
    soul3 = false
    soul0 = false

    setSoundVolume('empty', 0)

    jumpscared = true
    cancelTimer('warn')
    cancelTimer('warn2Kill')
    cancelTimer('catAppear')
    cancelTimer('catKill')
    setSoundVolume('musicFile', 0)
    cancelTimer('dieCount')
    cancelTimer('dieKill1')
    cancelTimer('dieKill2')
    cancelTimer('ratEat')
    cancelTimer('ratKill')
    cancelTimer('changeSound')
    cancelTimer('killSound')
    cancelTimer('killSound2')
    cancelTimer('sayCheese')
    cancelTimer('sayCheese1')
    cancelTimer('sayCheese2')

    playSound('scream-2', 1, 'scream')
    cancelTimer('warn')
    cancelTimer('warnAnim1')
    cancelTimer('warnAnim2')
    cancelTimer('warnAnim1_2')
    cancelTimer('warnAnim2_2')
    stopSound('warn')
    stopSound('empty')
    stopSound(_)

    makeLuaSprite('red', '')
    setObjectCamera('red', 'other')
    addLuaSprite('red', true)
    doTweenColor('red', 'red', '000000', 3, 'expoIn')

    if num == 0 then
        makeGraphic('red', 1280, 720, 'FF0000')
    elseif num == 1 then
        makeGraphic('red', 1280, 720, '00FFFF')
    end

    makeLuaText('gameover', "YOU'RE DEAD", 1280, 0, 300)
    setTextSize('gameover', 42)
    setObjectCamera('gameover', 'other')
    setTextFont('gameover', 'ROCK.TTF')
    setProperty('gameover.antialiasing', true)
    setTextBorder('gameover', 0)
    addLuaText('gameover', true)
    setProperty('gameover.scale.x', 1.2)
    setProperty('gameover.scale.y', 1.2)
    startTween('goScale', 'gameover.scale', {x = 1, y = 1}, 0.6, {ease = 'expoOut'})

    if num == 0 then
        doTweenColor('goColor', 'gameover', 'FF0000', 3, 'expoIn')
    elseif num == 1 then
        doTweenColor('goColor', 'gameover', '00FFFF', 3, 'expoIn')
    end


    makeLuaText('who', '', 1280, 0, 650)
    setTextSize('who', 20)
    setObjectCamera('who', 'other')
    setTextFont('who', 'ROCC.TTF')
    setProperty('who.antialiasing', true)
    setTextBorder('who', 0)
    addLuaText('who', true)
    setProperty('who.alpha', 0)
    doTweenAlpha('who', 'who', 0.15, 6, 'expoIn')

    if who == 'cheese' then
        setTextString('who', 'Make sure you constantly look down and serve food.')
    elseif who == 'music' then
        setTextString('who', 'If the lights dim, switch to the corresponding song.')
    elseif who == 'closet' then
        setTextString('who', 'If you hear a whisper, hide in the closet.')
    elseif who == 'right_laugh' then
        setTextString('who', 'If you hear laughter on the right, turn the lights off and on.')
    elseif who == 'left_laugh' then
        setTextString('who', 'If you hear laughter on the left, hide in the closet.')
    elseif who == 'punches' then
        setTextString('who', 'If you hear knocking, look down.')

    elseif who == 'cat' then
        setTextString('who', 'Point to the monster that appears at the entrance with the flashlight.')
    elseif who == 'warn2' then
        setTextString('who', 'Point the flashlight at the blue alarm.')
    end

    makeLuaText('restart', 'press "R" to restart', 1280, 0, 600)
    setTextSize('restart', 24)
    setObjectCamera('restart', 'other')
    setTextBorder('restart', 0)
    setTextFont('restart', 'ROCC.TTF')
    setProperty('restart.antialiasing', true)
    addLuaText('restart', true)
    setProperty('restart.alpha', 0)
    doTweenAlpha('restart', 'restart', 0.5, 6, 'expoIn')

    if num == 0 then
        makeLuaSprite('blood', 'hailey/bloodEffect')
    elseif num == 1 then
        makeLuaSprite('blood', 'hailey/bloodEffect2')
    end
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
    setSoundVolume('musicFile', 0)
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